// generated by codegen/codegen.py
private import codeql.swift.generated.IpaTypes
private import codeql.swift.generated.Db
import codeql.swift.elements.expr.Expr

class ImplicitConversionExprBase extends Cached::TImplicitConversionExpr, Expr {
  Expr getImmediateSubExpr() {
    result = Cached::fromDbInstance(asDbInstance().(Db::ImplicitConversionExpr).getSubExpr())
  }

  final Expr getSubExpr() { result = getImmediateSubExpr().resolve() }
}
