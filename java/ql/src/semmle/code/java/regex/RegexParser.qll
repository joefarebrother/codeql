import Parser
import RegexSpecific as Conf

class RegexParserConfiguration extends ParserConfiguration {
  RegexParserConfiguration() { this = "Regex parser configuration" }

  override predicate hasTokenRegex(string regex) {
    regex = "[()|*+?\\-\\[\\]]"
    or
    regex = "\\[^"
  }

  override predicate hasTokenRegex(string regex, string id) {
    regex = "[^()|.\\[\\]\\\\]" and id = "normalchar"
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
    regex = "\\\\[(){}\\[\\]\\\\trnNhvVR-]" and id = "normalchar"
    or
    regex = "\\\\[DdwWsS]" and id = "escclass"
    or
    regex = "\\(\\?[ismxnd\\^:]" and id = "("
    // or
    // regex = "\\[:alpha:\\]|\\[:alnum:\\]|\\[:punct:\\]" and id = "class"
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
   *
   * class -> '[' classinner ']'
   * |      '[^' classinner ']'
   * |      escclass
   * |      '[]'  if allowed empty classes
   * |      '[^]' if allowed empty classes
   * classinner -> classstart classinner1
   * |      classstart
   * classinner1 -> classinner2 '-'
   * |      classinner2
   * classinner2 -> classpart
   * |      classpart classinner2
   * classstart -> '-'
   * |      ']' if not allowed empty classes
   * |      classpart
   * classpart -> normalchar
   * |      classrange
   * |      escclass
   * classrange -> normalchar '-' normalchar
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
    or
    a in ["normalchar", "-", "]"] and
    result = "char"
    or
    a in ["normalchar", "(", ")", ".", "|"] and result = "clschar"
    or
    a = "escclass" and result = "class"
    or
    a = "classstart" and result = "classinner"
    or
    a = "classinner2" and result = "classinner1"
    or
    a in ["classpart", "-"] and result = "classstart"
    or
    a = "classpart" and result = "classinner2"
    or
    a = "]" and not Conf::allowedEmptyClasses() and result = "classstart"
    or
    a in ["clschar", "classrange", "escclass"] and result = "classpart"
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
    or
    a in ["[", "[^"] and b = "]" and Conf::allowedEmptyClasses() and result = "class"
    or
    a = "classstart" and b = "classinner1" and result = "classinner"
    or
    a = "classpart" and b = "classinner2" and result = "classinner2"
    or
    a = "classinner2" and b = "-" and result = "classinner1"
  }

  override string rule(string a, string b, string c) {
    a = "orregex" and b = "|" and c = "seqregex" and result = "orregex"
    or
    a = "(" and b = "regex" and c = ")" and result = "primary"
    or
    a = "[" and b = "classinner" and c = "]" and result = "class"
    or
    a = "[^" and b = "classinner" and c = "]" and result = "class"
    or
    a = "clschar" and b = "-" and c = "clschar" and result = "classrange"
  }
}

class Regex extends Node {
  Regex() { this.hasId("regex") }
}

class ChRegex extends Regex {
  ChRegex() { this.hasId("char") and not this.getParent*() instanceof ClassRegex }

  string getChar() {
    exists(string t | t = this.getText() |
      t.length() = 1 and
      result = t
      or
      exists(string c |
        t.charAt(0) = "\\" and
        t.charAt(1) = c and
        result = c
      )
    )
  }
}

class ClassRegex extends Regex {
  ClassRegex() { this.hasId("class") }
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
