// generated by codegen/codegen.py
private import codeql.swift.generated.IpaTypes
private import codeql.swift.generated.Db
import codeql.swift.elements.decl.VarDecl

class ParamDeclBase extends Cached::TParamDecl, VarDecl {
  final override Db::ParamDecl asDbInstance() { this = Cached::TParamDecl(result) }

  override string getAPrimaryQlClass() { result = "ParamDecl" }

  predicate isInout() { asDbInstance().(Db::ParamDecl).isInout() }
}
