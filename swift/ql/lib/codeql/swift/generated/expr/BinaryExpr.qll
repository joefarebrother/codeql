// generated by codegen/codegen.py
private import codeql.swift.generated.IpaTypes
private import codeql.swift.generated.Db
import codeql.swift.elements.expr.ApplyExpr

class BinaryExprBase extends Cached::TBinaryExpr, ApplyExpr {
  final override Db::BinaryExpr asDbInstance() { this = Cached::TBinaryExpr(result) }

  override string getAPrimaryQlClass() { result = "BinaryExpr" }
}
