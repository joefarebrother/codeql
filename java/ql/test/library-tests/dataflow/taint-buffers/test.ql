import java
import semmle.code.java.dataflow.TaintTracking

class Conf extends TaintTracking::Configuration {
  Conf() { this = "qltest:dataflow:buffers" }

  override predicate isSource(DataFlow::Node n) {
    n.asExpr().(MethodAccess).getMethod().hasName("taint")
  }

  override predicate isSink(DataFlow::Node n) {
    exists(MethodAccess ma |
      ma.getMethod().hasName("sink") and
      ma.getAnArgument() = n.asExpr()
    )
  }
}

from DataFlow::Node src, DataFlow::Node sink, Conf conf
where conf.hasFlow(src, sink)
select src, sink
