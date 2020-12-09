import RegexParser

class RegexTestString extends ParsedString {
  RegexTestString() {
    this = "abcd|efgh|ijkl" or
    this = "a*" or
    this = "(abc)*x+y?" or
    this = "(.)\\1" or
    this = "[0-9]+" or
    this = "X{4}{1,3}{,1}{3,}" or
    this = "(?:you)+\\d+" or
    this = "\\d+[:alpha:]" or
    this = "[]]" or
    this = "[^a-z\\d-]" or
    this = "[-xyz]" or
    this = "\\(\\)[()\\]]"
  }

  override predicate getLocationInfo(string file, int col, int row, int col2, int row2) { none() }

  override ParserConfiguration getConfiguration() { result instanceof RegexParserConfiguration }
}

query predicate tokens(Token token, string id) { id = token.getId() }

query predicate tokens2(Token token, string id) { token.hasId(id) }

query predicate nodes(Node regex, string id) { id = regex.getId() }

query predicate regexes(Regex regex, string id) { id = regex.getId() }

query predicate rootRegexes(Regex regex) { regex.isRoot() }

query predicate rootedRegexes(Regex regex) { regex.isRooted() }

query predicate lengths(ParsedString str, int len) { len = getNumberOfTokens(str) }

query predicate unboundedRegexes(UnboundedRegex regex) { any() }

query predicate suffixRegexes(SuffixRegex outer, Regex inner) { inner = outer.getBody() }

query predicate rawTokens(ParsedString text, int pos, string id, string str) {
  str = text.tokens(pos, id)
}

query predicate orRegexes(OrRegex regex, Regex left, Regex right) {
  left = regex.getLeft() and
  right = regex.getRight()
}

query predicate captures(CaptureRegex capture, Regex contents) { contents = capture.getBody() }

query predicate classes(ClassRegex cls, boolean inv) {
  if cls.isInverted() then inv = true else inv = false
}

query predicate chars(ChRegex ch, string char) { char = ch.getChar() }

query predicate classChars(ClassChar ch, string char, ClassRegex reg) {
  char = ch.getChar() and reg = ch.getClass()
}

query predicate ranges(RepeatRegex rep, Regex body, int lo, int hi) {
  rep.getBody() = body and
  (if exists(rep.getLowerBound()) then lo = rep.getLowerBound() else lo = -1) and
  (if exists(rep.getUpperBound()) then hi = rep.getUpperBound() else hi = -1)
}
