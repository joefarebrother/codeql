// generated by codegen/codegen.py
private import codeql.swift.generated.IpaTypes
private import codeql.swift.generated.Db
import codeql.swift.elements.decl.OperatorDecl

class PostfixOperatorDeclBase extends Cached::TPostfixOperatorDecl, OperatorDecl {
  final override Db::PostfixOperatorDecl asDbInstance() {
    this = Cached::TPostfixOperatorDecl(result)
  }

  override string getAPrimaryQlClass() { result = "PostfixOperatorDecl" }
}
