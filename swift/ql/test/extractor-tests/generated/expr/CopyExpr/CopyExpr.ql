// generated by codegen/codegen.py, do not edit
import codeql.swift.elements
import TestUtils

from CopyExpr x, string hasType, Expr getSubExpr
where
  toBeTested(x) and
  not x.isUnknown() and
  (if x.hasType() then hasType = "yes" else hasType = "no") and
  getSubExpr = x.getSubExpr()
select x, "hasType:", hasType, "getSubExpr:", getSubExpr
