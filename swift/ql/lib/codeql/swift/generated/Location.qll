// generated by codegen/codegen.py
private import codeql.swift.generated.IpaTypes
private import codeql.swift.generated.Db
import codeql.swift.elements.Element
import codeql.swift.elements.File

class LocationBase extends Cached::TLocation, Element {
  File getImmediateFile() {
    result = Cached::fromDbInstance(asDbInstance().(Db::Location).getFile())
  }

  final File getFile() { result = getImmediateFile().resolve() }

  int getStartLine() { result = asDbInstance().(Db::Location).getStartLine() }

  int getStartColumn() { result = asDbInstance().(Db::Location).getStartColumn() }

  int getEndLine() { result = asDbInstance().(Db::Location).getEndLine() }

  int getEndColumn() { result = asDbInstance().(Db::Location).getEndColumn() }
}
