// generated by codegen/codegen.py, do not edit
/**
 * This module provides the public class `OpaqueTypeDecl`.
 */

private import OpaqueTypeDeclImpl
import codeql.swift.elements.decl.GenericTypeDecl
import codeql.swift.elements.type.GenericTypeParamType
import codeql.swift.elements.decl.ValueDecl

/**
 * A declaration of an opaque type, that is formally equivalent to a given type but abstracts it
 * away.
 *
 * Such a declaration is implicitly given when a declaration is written with an opaque result type,
 * for example
 * ```
 * func opaque() -> some SignedInteger { return 1 }
 * ```
 * See https://docs.swift.org/swift-book/LanguageGuide/OpaqueTypes.html.
 */
final class OpaqueTypeDecl = Impl::OpaqueTypeDecl;
