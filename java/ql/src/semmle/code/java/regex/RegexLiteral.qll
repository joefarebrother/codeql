import java
import RegexOperations
private import RegexParser
private import semmle.code.java.dataflow.DataFlow3

class RegexLiteralConfig extends DataFlow3::Configuration {
  RegexLiteralConfig() { this = "RegexLiteralConfig" }

  override predicate isSource(DataFlow3::Node source) { source.asExpr() instanceof StringLiteral }

  override predicate isSink(DataFlow3::Node sink) {
    exists(RegexCompilation comp | comp.getPattern() = sink.asExpr())
  }
}

class RegexLiteralValue extends ParsedString {
  StringLiteral lit;

  cached
  RegexLiteralValue() {
    this = lit.getValue() and
    exists(RegexLiteralConfig cfg, DataFlow3::Node source |
      source.asExpr() = lit and
      cfg.hasFlow(source, _)
    )
  }

  override ParserConfiguration getConfiguration() { result instanceof RegexParserConfiguration }

  override predicate getLocationInfo(
    string file, int startline, int startcol, int endline, int endcol
  ) {
    lit.hasLocationInfo(file, startline, startcol - 1, endline, endcol - 1)
  }

  StringLiteral getLiteral() { result = lit }
}

class RegexLiteral extends StringLiteral {
  RegexLiteralValue val;

  RegexLiteral() { val.getLiteral() = this }

  Regex getRegex() { result.getText() = val and result.isRoot() }
}
