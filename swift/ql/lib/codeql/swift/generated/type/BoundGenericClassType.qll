// generated by codegen/codegen.py, do not edit
/**
 * This module provides the generated definition of `BoundGenericClassType`.
 * INTERNAL: Do not import directly.
 */

private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.type.BoundGenericTypeImpl::Impl as BoundGenericTypeImpl

/**
 * INTERNAL: This module contains the fully generated definition of `BoundGenericClassType` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * INTERNAL: Do not reference the `Generated::BoundGenericClassType` class directly.
   * Use the subclass `BoundGenericClassType`, where the following predicates are available.
   */
  class BoundGenericClassType extends Synth::TBoundGenericClassType,
    BoundGenericTypeImpl::BoundGenericType
  {
    override string getAPrimaryQlClass() { result = "BoundGenericClassType" }
  }
}
