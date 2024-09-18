// generated by codegen, do not edit
/**
 * This module provides the public class `RecordPatField`.
 */

private import internal.RecordPatFieldImpl
import codeql.rust.elements.AstNode
import codeql.rust.elements.Pat

/**
 * A field in a record pattern. For example `a: 1` in:
 * ```rust
 * let Foo { a: 1, b: 2 } = foo;
 * ```
 */
final class RecordPatField = Impl::RecordPatField;
