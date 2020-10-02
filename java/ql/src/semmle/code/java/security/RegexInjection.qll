/** Definitions for reasoning about untrusted data being used as part of a regular expression. */

import java
import semmle.code.java.regex.RegexOperations
import semmle.code.java.dataflow.FlowSources
import semmle.code.java.dataflow.TaintTracking

/**
 * A configuration for tracking flow from `RemoteFlowSource`s to `RegexCompilation`s.
 */
class RegexInjectionConfig extends TaintTracking::Configuration {
  RegexInjectionConfig() { this = "RegexInjectionConfig" }

  override predicate isSource(DataFlow::Node source) { source instanceof RemoteFlowSource }

  override predicate isSink(DataFlow::Node sink) {
    exists(RegexCompilation c | sink.asExpr() = c.getPattern())
  }

  override predicate isSanitizer(DataFlow::Node node) {
    node.getType() instanceof PrimitiveType or
    node.getType() instanceof BoxedType or
    node.asExpr().(MethodAccess).getMethod() instanceof PatternQuoteMethod
  }
}
