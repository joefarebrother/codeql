// generated by codegen, do not edit
import codeql.rust.elements
import TestUtils

from AsyncBlockExpr x, int getNumberOfStatements, string hasTail
where
  toBeTested(x) and
  not x.isUnknown() and
  getNumberOfStatements = x.getNumberOfStatements() and
  if x.hasTail() then hasTail = "yes" else hasTail = "no"
select x, "getNumberOfStatements:", getNumberOfStatements, "hasTail:", hasTail
