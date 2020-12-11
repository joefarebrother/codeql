/** Defenitions for compatibility with the JS ReDoS query */

private import RegexLiteral as L
private import RegexParser as P

private newtype TRegExpParent =
  TRegExpLiteral(L::RegexLiteral re) { exists(re.getRegex()) } or
  TRegExp(P::Regex re) {
    re.isRooted() and
    not exists(P::OrRegex par | par.isRooted() and re.(P::OrRegex) = par.getLeft())
  } or
  TClassChar(P::ClassChar ch) { ch.getClass().isRooted() and ch.isRooted() } or
  TClassRange(P::ClassRange rn) { rn.isRooted() }

class RegExpParent extends TRegExpParent {
  RegExpTerm getChild(int i) { none() }

  RegExpTerm getAChild() { result = getChild(_) }

  RegExpParent getParent() { result.getAChild() = this }

  int getNumChild() { result = count(getAChild()) }

  string toString() { result = "" }

  predicate hasLocationInfo(string file, int startline, int startcol, int endline, int endcol) {
    none()
  }
}

class RegExpLiteral extends RegExpParent, TRegExpLiteral {
  L::RegexLiteral re;

  RegExpLiteral() { this = TRegExpLiteral(re) }

  override RegExpTerm getChild(int i) { result = TRegExp(re.getRegex()) and i = 0 }

  predicate isDotAll() { none() }

  override string toString() { result = re.toString() }

  override predicate hasLocationInfo(
    string file, int startline, int startcol, int endline, int endcol
  ) {
    re.hasLocationInfo(file, startline, startcol, endline, endcol)
  }
}

class RegExpTerm extends RegExpParent {
  P::Node node;

  RegExpTerm() {
    this = TRegExp(node) or
    this = TClassChar(node) or
    this = TClassRange(node)
  }

  predicate isUsedAsRegExp() { any() }

  predicate isRootTerm() { node.isRoot() }

  override string toString() { result = node.toString() }

  RegExpLiteral getLiteral() { result = getRootTerm().getParent() }

  /**
   * Gets the outermost term of this regular expression.
   */
  RegExpTerm getRootTerm() {
    isRootTerm() and
    result = this
    or
    result = getParent().(RegExpTerm).getRootTerm()
  }

  override predicate hasLocationInfo(
    string file, int startline, int startcol, int endline, int endcol
  ) {
    node.hasLocationInfo(file, startline, startcol, endline, endcol)
  }
}

private class NormalRegExpTerm extends RegExpTerm, TRegExp {
  override P::Regex node;

  NormalRegExpTerm() { this = TRegExp(node) }
}

class RegExpAlt extends NormalRegExpTerm {
  override P::OrRegex node;

  override RegExpTerm getChild(int i) {
    result = TRegExp(orRevChild(node, orNumChild(node) - i - 1))
  }
}

private P::Regex orRevChild(P::Regex re, int i) {
  i = 0 and
  not re instanceof P::OrRegex and
  result = re
  or
  i = 0 and
  result = re.(P::OrRegex).getRight()
  or
  i > 0 and
  result = orRevChild(re.(P::OrRegex).getLeft(), i - 1)
}

private int orNumChild(P::OrRegex re) { result = strictcount(orRevChild(re, _)) }

class RegExpQuantifier extends NormalRegExpTerm {
  override P::SuffixRegex node;

  override RegExpTerm getChild(int i) { i = 0 and result = TRegExp(node.getBody()) }
}

class RegExpLookbehind extends NormalRegExpTerm {
  RegExpLookbehind() { none() }
}

class RegExpStar extends RegExpQuantifier {
  override P::StarRegex node;
}

class RegExpPlus extends RegExpQuantifier {
  override P::PlusRegex node;
}

class RegExpRange extends RegExpQuantifier {
  override P::RepeatRegex node;
}

class RegExpOpt extends RegExpQuantifier {
  override P::OptionalRegex node;
}

class RegExpConstant extends RegExpTerm {
  RegExpConstant() {
    this = TRegExp(node.(P::ChRegex))
    or
    this = TClassChar(node)
  }

  predicate isCharacter() { any() }

  string getValue() {
    result = node.(P::ChRegex).getChar()
    or
    result = node.(P::ClassChar).getChar()
  }
}

class RegExpDot extends NormalRegExpTerm {
  override P::DotRegex node;
}

class RegExpCharacterClass extends NormalRegExpTerm {
  override P::ClassRegex node;

  override RegExpTerm getChild(int i) {
    result = classPart(classChildHelper(node.getLeftNode(), i))
  }

  predicate isInverted() { node.isInverted() }

  predicate isUniversalClass() {
    // [^]
    isInverted() and not exists(getAChild())
    or
    // [\w\W] and similar
    not isInverted() and
    exists(string cce1, string cce2 |
      cce1 = getAChild().(RegExpCharacterClassEscape).getValue() and
      cce2 = getAChild().(RegExpCharacterClassEscape).getValue()
    |
      cce1 != cce2 and cce1.toLowerCase() = cce2.toLowerCase()
    )
  }
}

private RegExpTerm classPart(P::Node node) {
  node.hasId("classstart") and
  (
    result = TClassChar(node) or
    result = TClassRange(node) or
    result = TRegExp(node.(P::EscapeClassRegex))
  )
}

private P::Node classChildHelper(P::Node node, int i) {
  exists(int n |
    n = strictcount(classChildRev(node, _)) and result = classChildRev(node, n - i - 1)
  )
}

private P::Node classChildRev(P::Node node, int i) {
  node.getId() in ["openclass-", "openclassclasspart", "[classstart", "[^classstart"] and
  (
    i = 0 and result = node.getRightNode()
    or
    i > 0 and result = classChildRev(node.getLeftNode(), i - 1)
  )
}

class RegExpCharacterClassEscape extends NormalRegExpTerm {
  override P::EscapeClassRegex node;

  string getValue() { result = node.getClass() }
}

class RegExpCharacterRange extends RegExpTerm {
  override P::ClassRange node;

  RegExpCharacterRange() { this = TClassRange(node) }

  override RegExpTerm getChild(int i) {
    i = 0 and
    result = TClassChar(node.getLowerBound())
    or
    i = 1 and
    result = TClassChar(node.getUpperBound())
  }

  /** Holds if `lo` is the lower bound of this character range and `hi` the upper bound. */
  predicate isRange(string lo, string hi) {
    lo = getChild(0).(RegExpConstant).getValue() and
    hi = getChild(1).(RegExpConstant).getValue()
  }
}

class RegExpSequence extends NormalRegExpTerm {
  override P::SequenceRegex node;

  override RegExpTerm getChild(int i) {
    i = 0 and
    result = TRegExp(node.getLeft())
    or
    i = 1 and
    result = TRegExp(node.getRight())
  }
}

class RegExpGroup extends NormalRegExpTerm {
  override P::CaptureRegex node;

  override RegExpTerm getChild(int i) {
    i = 0 and
    result = TRegExp(node.getBody())
  }
}
