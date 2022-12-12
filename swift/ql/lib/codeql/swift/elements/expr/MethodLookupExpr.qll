private import codeql.swift.generated.expr.MethodLookupExpr
private import codeql.swift.elements.expr.MethodLookupExprConstructor
private import codeql.swift.elements.expr.Expr
private import codeql.swift.elements.decl.Decl
private import codeql.swift.elements.decl.MethodDecl
private import codeql.swift.generated.Raw
private import codeql.swift.generated.Synth

class MethodLookupExpr extends Generated::MethodLookupExpr {
  override string toString() { result = "." + this.getMember().toString() }

  override Expr getImmediateBase() {
    result = Synth::convertExprFromRaw(this.getUnderlying().getBase())
  }

  override Decl getImmediateMember() {
    result = Synth::convertDeclFromRaw(extractDeclFromSelfApplyExpr(this.getUnderlying()))
  }

  MethodDecl getMethod() { result = this.getMember() }

  cached
  private Raw::SelfApplyExpr getUnderlying() { this = Synth::TMethodLookupExpr(result) }
}
