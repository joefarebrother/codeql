// generated by codegen/codegen.py
private import codeql.swift.generated.IpaTypes
private import codeql.swift.generated.Db
import codeql.swift.elements.type.BuiltinType

class BuiltinDefaultActorStorageTypeBase extends Cached::TBuiltinDefaultActorStorageType,
  BuiltinType {
  final override Db::BuiltinDefaultActorStorageType asDbInstance() {
    this = Cached::TBuiltinDefaultActorStorageType(result)
  }

  override string getAPrimaryQlClass() { result = "BuiltinDefaultActorStorageType" }
}
