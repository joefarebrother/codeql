// generated by codegen/codegen.py
private import codeql.swift.generated.IpaTypes
private import codeql.swift.generated.Db
import codeql.swift.elements.type.Type

class ExistentialTypeBase extends Cached::TExistentialType, Type {
  final override Db::ExistentialType asDbInstance() { this = Cached::TExistentialType(result) }

  override string getAPrimaryQlClass() { result = "ExistentialType" }

  Type getImmediateConstraint() {
    result = Cached::fromDbInstance(asDbInstance().(Db::ExistentialType).getConstraint())
  }

  final Type getConstraint() { result = getImmediateConstraint().resolve() }
}
