/**
 * @name Unbounded allocation
 * @kind path-problem
 * @problem.severity warning
 * @precision medium
 * @id java/unbounded-allocation
 * @tags security
 *       external/cwe/cwe-789
 */

import java
import UnboundedAllocationCommon
import semmle.code.java.dataflow.FlowSources
import DataFlow::PathGraph

class UnboundedDeserializationConfig extends TaintTracking::Configuration {
  UnboundedDeserializationConfig() { this = "UnboundedDeserializationConfig" }

  override predicate isSource(DataFlow::Node src) { src instanceof RemoteFlowSource }

  override predicate isSink(DataFlow::Node sink) { sink instanceof AllocationSink }

  override predicate isSanitizer(DataFlow::Node node) { hasUpperBound(node.asExpr()) }
}

from DataFlow::PathNode source, DataFlow::PathNode sink, UnboundedDeserializationConfig config
where config.hasFlowPath(source, sink)
select sink, source, sink, "Unbounded memory allocation"
