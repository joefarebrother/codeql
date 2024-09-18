// generated by codegen, do not edit
/**
 * This module provides the generated definition of `BlockExpr`.
 * INTERNAL: Do not import directly.
 */

private import codeql.rust.elements.internal.generated.Synth
private import codeql.rust.elements.internal.generated.Raw
import codeql.rust.elements.internal.BlockExprBaseImpl::Impl as BlockExprBaseImpl
import codeql.rust.elements.Label

/**
 * INTERNAL: This module contains the fully generated definition of `BlockExpr` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * A block expression. For example:
   * ```rust
   * {
   *     let x = 42;
   * }
   * ```
   * ```rust
   * 'label: {
   *     let x = 42;
   *     x
   * }
   * ```
   * INTERNAL: Do not reference the `Generated::BlockExpr` class directly.
   * Use the subclass `BlockExpr`, where the following predicates are available.
   */
  class BlockExpr extends Synth::TBlockExpr, BlockExprBaseImpl::BlockExprBase {
    override string getAPrimaryQlClass() { result = "BlockExpr" }

    /**
     * Gets the label of this block expression, if it exists.
     */
    Label getLabel() {
      result =
        Synth::convertLabelFromRaw(Synth::convertBlockExprToRaw(this).(Raw::BlockExpr).getLabel())
    }

    /**
     * Holds if `getLabel()` exists.
     */
    final predicate hasLabel() { exists(this.getLabel()) }
  }
}
