// generated by codegen/codegen.py
private import codeql.swift.generated.IpaTypes
private import codeql.swift.generated.Db
import codeql.swift.elements.expr.IdentityExpr

class AwaitExprBase extends Cached::TAwaitExpr, IdentityExpr {
  final override Db::AwaitExpr asDbInstance() { this = Cached::TAwaitExpr(result) }

  override string getAPrimaryQlClass() { result = "AwaitExpr" }
}
