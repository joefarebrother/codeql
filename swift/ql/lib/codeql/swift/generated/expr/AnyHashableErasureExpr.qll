// generated by codegen/codegen.py
private import codeql.swift.generated.IpaTypes
private import codeql.swift.generated.Db
import codeql.swift.elements.expr.ImplicitConversionExpr

class AnyHashableErasureExprBase extends Cached::TAnyHashableErasureExpr, ImplicitConversionExpr {
  final override Db::AnyHashableErasureExpr asDbInstance() {
    this = Cached::TAnyHashableErasureExpr(result)
  }

  override string getAPrimaryQlClass() { result = "AnyHashableErasureExpr" }
}
