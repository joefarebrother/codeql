// generated by codegen/codegen.py
private import codeql.swift.generated.IpaTypes
private import codeql.swift.generated.Db
import codeql.swift.elements.decl.GenericTypeDecl
import codeql.swift.elements.decl.IterableDeclContext
import codeql.swift.elements.type.Type

class NominalTypeDeclBase extends Cached::TNominalTypeDecl, GenericTypeDecl, IterableDeclContext {
  Type getImmediateType() {
    result = Cached::fromDbInstance(asDbInstance().(Db::NominalTypeDecl).getType())
  }

  final Type getType() { result = getImmediateType().resolve() }
}
