// generated by codegen/codegen.py
private import codeql.swift.generated.IpaTypes
private import codeql.swift.generated.Db
import codeql.swift.elements.expr.Expr

class AppliedPropertyWrapperExprBase extends Cached::TAppliedPropertyWrapperExpr, Expr {
  final override Db::AppliedPropertyWrapperExpr asDbInstance() {
    this = Cached::TAppliedPropertyWrapperExpr(result)
  }

  override string getAPrimaryQlClass() { result = "AppliedPropertyWrapperExpr" }
}
