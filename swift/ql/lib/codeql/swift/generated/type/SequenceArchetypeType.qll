// generated by codegen/codegen.py
private import codeql.swift.generated.IpaTypes
private import codeql.swift.generated.Db
import codeql.swift.elements.type.ArchetypeType

class SequenceArchetypeTypeBase extends Cached::TSequenceArchetypeType, ArchetypeType {
  final override Db::SequenceArchetypeType asDbInstance() {
    this = Cached::TSequenceArchetypeType(result)
  }

  override string getAPrimaryQlClass() { result = "SequenceArchetypeType" }
}
