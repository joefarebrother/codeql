// generated by codegen/codegen.py
private import codeql.swift.generated.IpaTypes
private import codeql.swift.generated.Db
import codeql.swift.elements.type.Type
import codeql.swift.elements.decl.ValueDecl

class TypeDeclBase extends Cached::TTypeDecl, ValueDecl {
  string getName() { result = asDbInstance().(Db::TypeDecl).getName() }

  Type getImmediateBaseType(int index) {
    result = Cached::fromDbInstance(asDbInstance().(Db::TypeDecl).getBaseType(index))
  }

  final Type getBaseType(int index) { result = getImmediateBaseType(index).resolve() }

  final Type getABaseType() { result = getBaseType(_) }

  final int getNumberOfBaseTypes() { result = count(getABaseType()) }
}
