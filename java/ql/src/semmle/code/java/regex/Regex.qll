import java
import RegexOperations
import RegexParser as P
import semmle.code.java.dataflow.DataFlow3

class RegexLiteralConfig extends DataFlow3::Configuration {
  RegexLiteralConfig() { this = "RegexLiteralConfig" }

  override predicate isSource(DataFlow3::Node source) { source.asExpr() instanceof StringLiteral }

  override predicate isSink(DataFlow3::Node sink) {
    exists(RegexCompilation comp | comp.getPattern() = sink.asExpr())
  }
}

class RegexLiteral extends P::ParsedString {
  StringLiteral lit;

  RegexLiteral() {
    this = lit.getValue() and
    exists(RegexLiteralConfig cfg, DataFlow3::Node source |
      source.asExpr() = lit and
      cfg.hasFlow(source, _)
    )
  }

  override P::ParserConfiguration getConfiguration() {
    result instanceof P::RegexParserConfiguration
  }

  override predicate getLocationInfo(
    string file, int startline, int startcol, int endline, int endcol
  ) {
    lit.hasLocationInfo(file, startline, startcol, endline, endcol)
  }
}

/** Compatibility with the javascript QL regex library */
module JS {
  // TODO
}
