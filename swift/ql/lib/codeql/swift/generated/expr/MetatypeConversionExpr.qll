// generated by codegen/codegen.py
private import codeql.swift.generated.IpaTypes
private import codeql.swift.generated.Db
import codeql.swift.elements.expr.ImplicitConversionExpr

class MetatypeConversionExprBase extends Cached::TMetatypeConversionExpr, ImplicitConversionExpr {
  final override Db::MetatypeConversionExpr asDbInstance() {
    this = Cached::TMetatypeConversionExpr(result)
  }

  override string getAPrimaryQlClass() { result = "MetatypeConversionExpr" }
}
