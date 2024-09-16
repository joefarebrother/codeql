// generated by codegen, remove this comment if you wish to edit this file
/**
 * This module provides a hand-modifiable wrapper around the generated class `RangePat`.
 *
 * INTERNAL: Do not use.
 */

private import codeql.rust.generated.RangePat

/**
 * INTERNAL: This module contains the customizable definition of `RangePat` and should not
 * be referenced directly.
 */
module Impl {
  /**
   * A range pattern. For example:
   * ```
   * match x {
   *     ..15 => "too cold",
   *     16..=25 => "just right",
   *     26.. => "too hot",
   * }
   * ```
   */
  class RangePat extends Generated::RangePat { }
}
