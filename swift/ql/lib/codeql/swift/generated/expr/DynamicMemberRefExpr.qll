// generated by codegen/codegen.py, do not edit
/**
 * This module provides the generated definition of `DynamicMemberRefExpr`.
 * INTERNAL: Do not import directly.
 */

private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.expr.DynamicLookupExprImpl::Impl as DynamicLookupExprImpl

/**
 * INTERNAL: This module contains the fully generated definition of `DynamicMemberRefExpr` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * INTERNAL: Do not reference the `Generated::DynamicMemberRefExpr` class directly.
   * Use the subclass `DynamicMemberRefExpr`, where the following predicates are available.
   */
  class DynamicMemberRefExpr extends Synth::TDynamicMemberRefExpr,
    DynamicLookupExprImpl::DynamicLookupExpr
  {
    override string getAPrimaryQlClass() { result = "DynamicMemberRefExpr" }
  }
}
