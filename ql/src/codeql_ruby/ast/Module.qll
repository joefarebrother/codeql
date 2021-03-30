private import codeql_ruby.AST
private import codeql_ruby.ast.Constant
private import internal.AST
private import internal.Module
private import internal.TreeSitter

/**
 * A representation of a run-time `module` or `class` value.
 */
class Module extends TConstant {
  Module() { this = TResolved(_, true) or this = TUnresolved(any(Namespace n)) }

  string toString() {
    this = TResolved(result, _)
    or
    exists(Namespace n | this = TUnresolved(n) and result = "...::" + n.toString())
  }

  Location getLocation() {
    exists(Namespace n | this = TUnresolved(n) and result = n.getLocation())
    or
    result =
      min(Namespace n, string qName, Location loc, int weight |
        this = TResolved(qName, _) and
        qName = constantDefinition(n) and
        loc = n.getLocation() and
        if exists(loc.getFile().getRelativePath()) then weight = 0 else weight = 1
      |
        loc
        order by
          weight, count(n.getAStmt()) desc, loc.getFile().getAbsolutePath(), loc.getStartLine(),
          loc.getStartColumn()
      )
  }
}

/**
 * The base class for classes, singleton classes, and modules.
 */
class ModuleBase extends BodyStmt, Scope, TModuleBase {
  /** Gets a method defined in this module/class. */
  MethodBase getAMethod() { result = this.getAStmt() }

  /** Gets the method named `name` in this module/class, if any. */
  MethodBase getMethod(string name) { result = this.getAMethod() and result.getName() = name }

  /** Gets a class defined in this module/class. */
  ClassDefinition getAClass() { result = this.getAStmt() }

  /** Gets the class named `name` in this module/class, if any. */
  ClassDefinition getClass(string name) { result = this.getAClass() and result.getName() = name }

  /** Gets a module defined in this module/class. */
  ModuleDefinition getAModule() { result = this.getAStmt() }

  /** Gets the module named `name` in this module/class, if any. */
  ModuleDefinition getModule(string name) { result = this.getAModule() and result.getName() = name }

  /** Gets the representation of the run-time value of this module or class. */
  Module getModule() { none() }
}

/**
 * A Ruby source file.
 *
 * ```rb
 * def main
 *   puts "hello world!"
 * end
 * main
 * ```
 */
class Toplevel extends ModuleBase, TToplevel {
  private Generated::Program g;

  Toplevel() { this = TToplevel(g) }

  final override string getAPrimaryQlClass() { result = "Toplevel" }

  /**
   * Gets the `n`th `BEGIN` block.
   */
  final BeginBlock getBeginBlock(int n) {
    toGenerated(result) =
      rank[n + 1](int i, Generated::BeginBlock b | b = g.getChild(i) | b order by i)
  }

  /**
   * Gets a `BEGIN` block.
   */
  final BeginBlock getABeginBlock() { result = getBeginBlock(_) }

  final override AstNode getAChild(string pred) {
    result = ModuleBase.super.getAChild(pred)
    or
    pred = "getBeginBlock" and result = this.getBeginBlock(_)
  }

  final override Module getModule() { result = TResolved("Object", true) }

  final override string toString() { result = g.getLocation().getFile().getBaseName() }
}

/**
 * A class or module definition.
 *
 * ```rb
 * class Foo
 *   def bar
 *   end
 * end
 * module Bar
 *   class Baz
 *   end
 * end
 * ```
 */
class Namespace extends ModuleBase, ConstantWriteAccess, TNamespace {
  override string getAPrimaryQlClass() { result = "Namespace" }

  /**
   * Gets the name of the module/class. In the following example, the result is
   * `"Foo"`.
   * ```rb
   * class Foo
   * end
   * ```
   *
   * N.B. in the following example, where the module/class name uses the scope
   * resolution operator, the result is the name being resolved, i.e. `"Bar"`.
   * Use `getScopeExpr` to get the `Foo` for `Foo`.
   * ```rb
   * module Foo::Bar
   * end
   * ```
   */
  override string getName() { none() }

  /**
   * Gets the scope expression used in the module/class name's scope resolution
   * operation, if any.
   *
   * In the following example, the result is the `Expr` for `Foo`.
   *
   * ```rb
   * module Foo::Bar
   * end
   * ```
   *
   * However, there is no result for the following example, since there is no
   * scope resolution operation.
   *
   * ```rb
   * module Baz
   * end
   * ```
   */
  override Expr getScopeExpr() { none() }

  /**
   * Holds if the module/class name uses the scope resolution operator to access the
   * global scope, as in this example:
   *
   * ```rb
   * class ::Foo
   * end
   * ```
   */
  override predicate hasGlobalScope() { none() }

  final override Module getModule() {
    result = any(string qName | qName = constantDefinition(this) | TResolved(qName, true))
    or
    result = TUnresolved(this)
  }

  override AstNode getAChild(string pred) {
    result = ModuleBase.super.getAChild(pred) or
    result = ConstantWriteAccess.super.getAChild(pred)
  }

  final override string toString() { result = ConstantWriteAccess.super.toString() }
}

/**
 * A class definition.
 *
 * ```rb
 * class Foo
 *   def bar
 *   end
 * end
 * ```
 */
class ClassDefinition extends Namespace, TClass {
  private Generated::Class g;

  ClassDefinition() { this = TClass(g) }

  final override string getAPrimaryQlClass() { result = "ClassDefinition" }

  /**
   * Gets the `Expr` used as the superclass in the class definition, if any.
   *
   * In the following example, the result is a `ConstantReadAccess`.
   * ```rb
   * class Foo < Bar
   * end
   * ```
   *
   * In the following example, where the superclass is a call expression, the
   * result is a `Call`.
   * ```rb
   * class C < foo()
   * end
   * ```
   */
  final Expr getSuperclassExpr() { toGenerated(result) = g.getSuperclass().getChild() }

  final override string getName() {
    result = g.getName().(Generated::Token).getValue() or
    result = g.getName().(Generated::ScopeResolution).getName().(Generated::Token).getValue()
  }

  final override Expr getScopeExpr() {
    toGenerated(result) = g.getName().(Generated::ScopeResolution).getScope()
  }

  final override predicate hasGlobalScope() {
    exists(Generated::ScopeResolution sr |
      sr = g.getName() and
      not exists(sr.getScope())
    )
  }

  final override AstNode getAChild(string pred) {
    result = Namespace.super.getAChild(pred)
    or
    pred = "getSuperclassExpr" and result = this.getSuperclassExpr()
  }
}

/**
 * A definition of a singleton class on an object.
 *
 * ```rb
 * class << foo
 *   def bar
 *     p 'bar'
 *   end
 * end
 * ```
 */
class SingletonClass extends ModuleBase, TSingletonClass {
  private Generated::SingletonClass g;

  SingletonClass() { this = TSingletonClass(g) }

  final override string getAPrimaryQlClass() { result = "ClassDefinition" }

  /**
   * Gets the expression resulting in the object on which the singleton class
   * is defined. In the following example, the result is the `Expr` for `foo`:
   *
   * ```rb
   * class << foo
   * end
   * ```
   */
  final Expr getValue() { toGenerated(result) = g.getValue() }

  final override string toString() { result = "class << ..." }

  final override AstNode getAChild(string pred) {
    result = ModuleBase.super.getAChild(pred)
    or
    pred = "getValue" and result = this.getValue()
  }
}

/**
 * A module definition.
 *
 * ```rb
 * module Foo
 *   class Bar
 *   end
 * end
 * ```
 *
 * N.B. this class represents a single instance of a module definition. In the
 * following example, classes `Bar` and `Baz` are both defined in the module
 * `Foo`, but in two syntactically distinct definitions, meaning that there
 * will be two instances of `ModuleDefinition` in the database.
 *
 * ```rb
 * module Foo
 *   class Bar; end
 * end
 *
 * module Foo
 *   class Baz; end
 * end
 * ```
 */
class ModuleDefinition extends Namespace, TModule {
  private Generated::Module g;

  ModuleDefinition() { this = TModule(g) }

  final override string getAPrimaryQlClass() { result = "ModuleDefinition" }

  final override string getName() {
    result = g.getName().(Generated::Token).getValue() or
    result = g.getName().(Generated::ScopeResolution).getName().(Generated::Token).getValue()
  }

  final override Expr getScopeExpr() {
    toGenerated(result) = g.getName().(Generated::ScopeResolution).getScope()
  }

  final override predicate hasGlobalScope() {
    exists(Generated::ScopeResolution sr |
      sr = g.getName() and
      not exists(sr.getScope())
    )
  }
}
