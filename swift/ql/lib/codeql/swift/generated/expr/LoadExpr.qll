// generated by codegen/codegen.py
private import codeql.swift.generated.IpaTypes
private import codeql.swift.generated.Db
import codeql.swift.elements.expr.ImplicitConversionExpr

class LoadExprBase extends Cached::TLoadExpr, ImplicitConversionExpr {
  final override Db::LoadExpr asDbInstance() { this = Cached::TLoadExpr(result) }

  override string getAPrimaryQlClass() { result = "LoadExpr" }
}
