// generated by codegen/codegen.py
private import codeql.swift.generated.IpaTypes
private import codeql.swift.generated.Db
import codeql.swift.elements.expr.Expr
import codeql.swift.elements.decl.VarDecl

class SuperRefExprBase extends Cached::TSuperRefExpr, Expr {
  final override Db::SuperRefExpr asDbInstance() { this = Cached::TSuperRefExpr(result) }

  override string getAPrimaryQlClass() { result = "SuperRefExpr" }

  VarDecl getImmediateSelf() {
    result = Cached::fromDbInstance(asDbInstance().(Db::SuperRefExpr).getSelf())
  }

  final VarDecl getSelf() { result = getImmediateSelf().resolve() }
}
