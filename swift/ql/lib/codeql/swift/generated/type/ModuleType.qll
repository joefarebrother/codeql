// generated by codegen/codegen.py, do not edit
/**
 * This module provides the generated definition of `ModuleType`.
 * INTERNAL: Do not import directly.
 */

private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.decl.ModuleDecl
import codeql.swift.elements.type.TypeImpl::Impl as TypeImpl

/**
 * INTERNAL: This module contains the fully generated definition of `ModuleType` and should not
 * be referenced directly.
 */
module Generated {
  /**
   * INTERNAL: Do not reference the `Generated::ModuleType` class directly.
   * Use the subclass `ModuleType`, where the following predicates are available.
   */
  class ModuleType extends Synth::TModuleType, TypeImpl::Type {
    override string getAPrimaryQlClass() { result = "ModuleType" }

    /**
     * Gets the module of this module type.
     */
    ModuleDecl getModule() {
      result =
        Synth::convertModuleDeclFromRaw(Synth::convertModuleTypeToRaw(this)
              .(Raw::ModuleType)
              .getModule())
    }
  }
}
