// generated by codegen/codegen.py
private import codeql.swift.generated.IpaTypes
private import codeql.swift.generated.Db
import codeql.swift.elements.type.AnyMetatypeType

class ExistentialMetatypeTypeBase extends Cached::TExistentialMetatypeType, AnyMetatypeType {
  final override Db::ExistentialMetatypeType asDbInstance() {
    this = Cached::TExistentialMetatypeType(result)
  }

  override string getAPrimaryQlClass() { result = "ExistentialMetatypeType" }
}
