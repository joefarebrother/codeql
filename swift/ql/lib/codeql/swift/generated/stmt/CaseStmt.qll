// generated by codegen/codegen.py
private import codeql.swift.generated.IpaTypes
private import codeql.swift.generated.Db
import codeql.swift.elements.stmt.CaseLabelItem
import codeql.swift.elements.stmt.Stmt
import codeql.swift.elements.decl.VarDecl

class CaseStmtBase extends Cached::TCaseStmt, Stmt {
  final override Db::CaseStmt asDbInstance() { this = Cached::TCaseStmt(result) }

  override string getAPrimaryQlClass() { result = "CaseStmt" }

  Stmt getImmediateBody() {
    result = Cached::fromDbInstance(asDbInstance().(Db::CaseStmt).getBody())
  }

  final Stmt getBody() { result = getImmediateBody().resolve() }

  CaseLabelItem getImmediateLabel(int index) {
    result = Cached::fromDbInstance(asDbInstance().(Db::CaseStmt).getLabel(index))
  }

  final CaseLabelItem getLabel(int index) { result = getImmediateLabel(index).resolve() }

  final CaseLabelItem getALabel() { result = getLabel(_) }

  final int getNumberOfLabels() { result = count(getALabel()) }

  VarDecl getImmediateVariable(int index) {
    result = Cached::fromDbInstance(asDbInstance().(Db::CaseStmt).getVariable(index))
  }

  final VarDecl getVariable(int index) { result = getImmediateVariable(index).resolve() }

  final VarDecl getAVariable() { result = getVariable(_) }

  final int getNumberOfVariables() { result = count(getAVariable()) }
}
