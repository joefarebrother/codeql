// generated by codegen/codegen.py
private import codeql.swift.generated.IpaTypes
private import codeql.swift.generated.Db
import codeql.swift.elements.expr.IdentityExpr

class UnresolvedMemberChainResultExprBase extends Cached::TUnresolvedMemberChainResultExpr,
  IdentityExpr {
  final override Db::UnresolvedMemberChainResultExpr asDbInstance() {
    this = Cached::TUnresolvedMemberChainResultExpr(result)
  }

  override string getAPrimaryQlClass() { result = "UnresolvedMemberChainResultExpr" }
}
