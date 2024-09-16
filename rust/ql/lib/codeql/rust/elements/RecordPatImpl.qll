// generated by codegen, remove this comment if you wish to edit this file
/**
 * This module provides a hand-modifiable wrapper around the generated class `RecordPat`.
 *
 * INTERNAL: Do not use.
 */

private import codeql.rust.generated.RecordPat

/**
 * INTERNAL: This module contains the customizable definition of `RecordPat` and should not
 * be referenced directly.
 */
module Impl {
  /**
   * A record pattern. For example:
   * ```
   * match x {
   *     Foo { a: 1, b: 2 } => "ok",
   *     Foo { .. } => "fail",
   * }
   * ```
   */
  class RecordPat extends Generated::RecordPat { }
}
