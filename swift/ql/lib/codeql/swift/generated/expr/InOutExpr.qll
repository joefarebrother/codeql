// generated by codegen/codegen.py
private import codeql.swift.generated.IpaTypes
private import codeql.swift.generated.Db
import codeql.swift.elements.expr.Expr

class InOutExprBase extends Cached::TInOutExpr, Expr {
  final override Db::InOutExpr asDbInstance() { this = Cached::TInOutExpr(result) }

  override string getAPrimaryQlClass() { result = "InOutExpr" }

  Expr getImmediateSubExpr() {
    result = Cached::fromDbInstance(asDbInstance().(Db::InOutExpr).getSubExpr())
  }

  final Expr getSubExpr() { result = getImmediateSubExpr().resolve() }
}
