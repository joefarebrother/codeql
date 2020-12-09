/** Language-specific options for the regex parser. */

/**
 * Whether empty classes (e.g. [], [^]) are allowed.
 * When they aren't, things like []] are allowed.
 * For java, this they are not allowed.
 */
predicate allowedEmptyClasses() { none() }
