// generated by codegen, do not edit
/**
 * This module provides the generated definition of `TupleExpr`.
 * INTERNAL: Do not import directly.
 */

private import codeql.rust.elements.internal.generated.Synth
private import codeql.rust.elements.internal.generated.Raw
import codeql.rust.elements.Expr
import codeql.rust.elements.internal.ExprImpl::Impl as ExprImpl

/**
 * INTERNAL: This module contains the fully generated definition of `TupleExpr` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * A tuple expression. For example:
   * ```rust
   * (1, "one");
   * (2, "two")[0] = 3;
   * ```
   * INTERNAL: Do not reference the `Generated::TupleExpr` class directly.
   * Use the subclass `TupleExpr`, where the following predicates are available.
   */
  class TupleExpr extends Synth::TTupleExpr, ExprImpl::Expr {
    override string getAPrimaryQlClass() { result = "TupleExpr" }

    /**
     * Gets the `index`th expression of this tuple expression (0-based).
     */
    Expr getExpr(int index) {
      result =
        Synth::convertExprFromRaw(Synth::convertTupleExprToRaw(this).(Raw::TupleExpr).getExpr(index))
    }

    /**
     * Gets any of the expressions of this tuple expression.
     */
    final Expr getAnExpr() { result = this.getExpr(_) }

    /**
     * Gets the number of expressions of this tuple expression.
     */
    final int getNumberOfExprs() { result = count(int i | exists(this.getExpr(i))) }

    /**
     * Holds if this tuple expression is assignee expression.
     */
    predicate isAssigneeExpr() {
      Synth::convertTupleExprToRaw(this).(Raw::TupleExpr).isAssigneeExpr()
    }
  }
}
