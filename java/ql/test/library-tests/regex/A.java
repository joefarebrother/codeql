import java.util.regex.Pattern;

class A {
    void test() {
        Pattern.compile("abcd|efgh|ijkl");
        Pattern.compile("a*");
        Pattern.compile("(abc)*x+y?");
        Pattern.compile("(.)\\1");
        Pattern.compile("[0-9]+");
        Pattern.compile("X{4}{1,3}{,1}{3,}");
        Pattern.compile("(?:you)+\\d+");
        Pattern.compile("\\d+[:alpha:]");
        Pattern.compile("[]]");
        Pattern.compile("[^a-z\\d-]");
        Pattern.compile("[-xyz]");
        Pattern.compile("\\(\\)[()\\]]");
    }
}