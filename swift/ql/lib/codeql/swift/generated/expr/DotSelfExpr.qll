// generated by codegen/codegen.py
private import codeql.swift.generated.IpaTypes
private import codeql.swift.generated.Db
import codeql.swift.elements.expr.IdentityExpr

class DotSelfExprBase extends Cached::TDotSelfExpr, IdentityExpr {
  final override Db::DotSelfExpr asDbInstance() { this = Cached::TDotSelfExpr(result) }

  override string getAPrimaryQlClass() { result = "DotSelfExpr" }
}
