// generated by codegen/codegen.py
private import codeql.swift.generated.IpaTypes
private import codeql.swift.generated.Db
import codeql.swift.elements.expr.Expr
import codeql.swift.elements.pattern.Pattern

class ExprPatternBase extends Cached::TExprPattern, Pattern {
  final override Db::ExprPattern asDbInstance() { this = Cached::TExprPattern(result) }

  override string getAPrimaryQlClass() { result = "ExprPattern" }

  Expr getImmediateSubExpr() {
    result = Cached::fromDbInstance(asDbInstance().(Db::ExprPattern).getSubExpr())
  }

  final Expr getSubExpr() { result = getImmediateSubExpr().resolve() }
}
