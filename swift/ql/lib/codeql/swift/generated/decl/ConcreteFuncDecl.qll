// generated by codegen/codegen.py
private import codeql.swift.generated.IpaTypes
private import codeql.swift.generated.Db
import codeql.swift.elements.decl.FuncDecl

class ConcreteFuncDeclBase extends Cached::TConcreteFuncDecl, FuncDecl {
  final override Db::ConcreteFuncDecl asDbInstance() { this = Cached::TConcreteFuncDecl(result) }

  override string getAPrimaryQlClass() { result = "ConcreteFuncDecl" }
}
