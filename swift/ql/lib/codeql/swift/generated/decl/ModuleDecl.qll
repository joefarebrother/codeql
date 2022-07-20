// generated by codegen/codegen.py
private import codeql.swift.generated.IpaTypes
private import codeql.swift.generated.Db
import codeql.swift.elements.decl.TypeDecl

class ModuleDeclBase extends Cached::TModuleDecl, TypeDecl {
  final override Db::ModuleDecl asDbInstance() { this = Cached::TModuleDecl(result) }

  override string getAPrimaryQlClass() { result = "ModuleDecl" }

  predicate isBuiltinModule() { asDbInstance().(Db::ModuleDecl).isBuiltinModule() }

  predicate isSystemModule() { asDbInstance().(Db::ModuleDecl).isSystemModule() }
}
