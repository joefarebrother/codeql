/** Definitions for reasoning about operations where a regular expression is matched against a string. */

import java

/**
 * The class `java.util.regex.Pattern`.
 */
class TypePattern extends Class {
  TypePattern() { this.hasQualifiedName("java.util.regex", "Pattern") }
}

/**
 * The  method `Pattern.quote`.
 */
class PatternQuoteMethod extends Method {
  PatternQuoteMethod() {
    this.getDeclaringType() instanceof TypePattern and
    // static String quote​(String s)
    this.hasName("quote")
  }
}

/** A call that results in a regular expression being compiled. */
class RegexCompilation extends Call {
  RegexCompilation() { this.getCallee() instanceof RegexCompilationCallable }

  /* Gets the expression that is used as the pattern to be compiled. */
  Expr getPattern() {
    exists(RegexCompilationCallable rcc, int arg |
      this.getCallee() = rcc and
      arg = rcc.getPatternIndex()
    |
      result = this.getArgument(arg)
    )
  }
}

/** A callable that compiles a regular expression. */
abstract class RegexCompilationCallable extends Callable {
  /** Gets the parameter index of the pattern to be compiled. */
  abstract int getPatternIndex();
}

private class PatternCompileMethod extends RegexCompilationCallable {
  PatternCompileMethod() {
    this.getDeclaringType() instanceof TypePattern and
    // static Pattern compile​(String regex)
    // static Pattern compile​(String regex, int flags)
    this.hasName("compile")
  }

  override int getPatternIndex() { result = 0 }
}

private class PatternMatchesMethod extends RegexCompilationCallable {
  PatternMatchesMethod() {
    this.getDeclaringType() instanceof TypePattern and
    // static boolean matches​(String regex, CharSequence input)
    this.hasName("matches")
  }

  override int getPatternIndex() { result = 0 }
}

private class StringMatchesMethod extends RegexCompilationCallable {
  StringMatchesMethod() {
    this.getDeclaringType() instanceof TypeString and
    // boolean matches​(String regex)
    this.hasName("matches")
  }

  override int getPatternIndex() { result = 0 }
}
