import Parser

class RegexParserConfiguration extends ParserConfiguration {
  RegexParserConfiguration() { this = "Regex parser configuration" }

  override predicate hasTokenRegex(string regex) { regex = "[()|*+?]" }

  override predicate hasTokenRegex(string regex, string id) {
    regex = "\\[[^\\]]+\\]" and id = "class"
    or
    regex = "[^()|.\\[\\]{}\\\\]" and id = "char"
    or
    regex = "\\\\[0-9]+" and id = "backref"
    or
    regex = "[.]" and id = "anychar"
    or
    regex = "\\{[0-9]+\\}" and id = "fixedrepeat"
    or
    regex = "\\{,[0-9]+\\}" and id = "uptorepeat"
    or
    regex = "\\{[0-9]+,[0-9]+\\}" and id = "rangerepeat"
    or
    regex = "\\{[0-9]+,\\}" and id = "openrepeat"
    or
    regex = "\\[(){}\\[\\]trnNhvVR]." and id = "char"
    or
    regex = "\\\\[DdwWsS]" and id = "class"
    or
    regex = "\\(\\?[ismxnd\\^:]" and id = "("
    or
    regex = "\\[:alpha:\\]|\\[:alnum:\\]|\\[:punct:\\]" and id = "class"
  }

  /*
   * Use a proper unambiguous grammar for regexes:
   *
   * regex -> orregex
   * orregex -> seqregex
   * |      orregex '|' seqregex
   * seqregex -> primary
   * |      primary seqregex
   * primary -> '(' regex ')'
   * |      primary *
   * |      primary +
   * |      char
   * |      class
   */

  override string rule(string a) {
    a in ["char", "anychar", "backref", "class"] and
    result = "primary"
    or
    a = "primary" and result = "seqregex"
    or
    a = "seqregex" and result = "orregex"
    or
    a = "orregex" and result = "regex"
  }

  override string rule(string a, string b) {
    a = "primary" and b = "seqregex" and result = "seqregex"
    or
    a = "primary" and b = "*" and result = "primary"
    or
    a = "primary" and b = "+" and result = "primary"
    or
    a = "primary" and b = "?" and result = "primary"
    or
    a = "primary" and b = "fixedrepeat" and result = "primary"
    or
    a = "primary" and b = "rangerepeat" and result = "primary"
    or
    a = "primary" and b = "uptorepeat" and result = "primary"
    or
    a = "primary" and b = "openrepeat" and result = "primary"
  }

  override string rule(string a, string b, string c) {
    a = "orregex" and b = "|" and c = "seqregex" and result = "orregex"
    or
    a = "(" and b = "regex" and c = ")" and result = "primary"
  }
}

class Regex extends Node {
  Regex() { this.hasId("regex") }
}

class ChRegex extends Regex {
  ChRegex() { id = "char" }
}

class ClassRegex extends Regex {
  ClassRegex() { id = "class" }
}

class SequenceRegex extends Regex {
  SequenceRegex() { id = "primaryseqregex" }

  Regex getLeft() { result = this.getLeftNode() }

  Regex getRight() { result = this.getRightNode() }
}

abstract class SuffixRegex extends Regex {
  Regex getBody() { result = this.getLeftNode() }
}

abstract class UnboundedRegex extends SuffixRegex { }

class StarRegex extends UnboundedRegex {
  StarRegex() { id = "primary*" }
}

class PlusRegex extends UnboundedRegex {
  PlusRegex() { id = "primary+" }
}

class FixedRepeatRegex extends SuffixRegex {
  FixedRepeatRegex() { id = "primaryfixedrepeat" }
}

class UptoRepeatRegex extends SuffixRegex {
  UptoRepeatRegex() { id = "primaryuptorepeat" }
}

class RangeRegex extends SuffixRegex {
  RangeRegex() { id = "primaryrangerepeat" }
}

class OpenRepeatRegex extends UnboundedRegex {
  OpenRepeatRegex() { id = "primaryopenrepeat" }
}

class OptionalRegex extends SuffixRegex {
  OptionalRegex() { id = "primary?" }
}

class OrRegex extends Regex {
  OrRegex() { id = "orregex|seqregex" }

  Regex getLeft() { result = this.getLeftNode().getLeftNode() }

  Regex getRight() { result = this.getRightNode() }
}

class CaptureRegex extends Regex {
  CaptureRegex() { id = "(regex)" }

  Regex getBody() { result = this.getLeftNode().getRightNode() }
}

class Backref extends Regex {
  Backref() { id = "backref" }
}

class Repeat extends Regex {
  Repeat() { id = "regexrepeat" }
}
