// Licenses mentioned can actually be found in javascript/ql/test/query-tests/Performance/ReDoS

import java.util.regex.Pattern;

class A {
void test() {

// NOT GOOD; attack: "_" + "__".repeat(100)
// Adapted from marked (https://github.com/markedjs/marked), which is licensed
// under the MIT license; see file marked-LICENSE.
String bad1 = "^\\b_((?:__|[\\s\\S])+?)_\\b|^\\*((?:\\*\\*|[\\s\\S])+?)\\*(?!\\*)";

// GOOD
// Adapted from marked (https://github.com/markedjs/marked), which is licensed
// under the MIT license; see file marked-LICENSE.
String good1 = "^\\b_((?:__|[^_])+?)_\\b|^\\*((?:\\*\\*|[^*])+?)\\*(?!\\*)";

// GOOD - there is no witness in the end that could cause the regexp to not match
// Adapted from brace-expansion (https://github.com/juliangruber/brace-expansion),
// which is licensed under the MIT license; see file brace-expansion-LICENSE.
String good2 = "(.*,)+.+";

// NOT GOOD; attack: " '" + "\\\\".repeat(100)
// Adapted from CodeMirror (https://github.com/codemirror/codemirror),
// which is licensed under the MIT license; see file CodeMirror-LICENSE.
String bad2 = "^(?:\\s+(?:\"(?:[^\"\\\\]|\\\\\\\\|\\\\.)+\"|'(?:[^'\\\\]|\\\\\\\\|\\\\.)+'|\\((?:[^)\\\\]|\\\\\\\\|\\\\.)+\\)))?";

// GOOD
// Adapted from lulucms2 (https://github.com/yiifans/lulucms2).
String good19 = "\\(\\*(?:[\\s\\S]*?\\(\\*[\\s\\S]*?\\*\\))*[\\s\\S]*?\\*\\)";

// GOOD
// Adapted from jest (https://github.com/facebook/jest), which is licensed
// under the MIT license; see file jest-LICENSE.
String good3 = "^ *(\\S.*\\|.*)\\n *([-:]+ *\\|[-| :]*)\\n((?:.*\\|.*(?:\\n|$))*)\\n*";

// NOT GOOD, Stringiant of good3; attack: \"a|\\n:|\\n\" + \"||\\n\".repeat(100)
String bad3 = "^ *(\\S.*\\|.*)\\n *([-:]+ *\\|[-| :]*)\\n((?:.*\\|.*(?:\\n|$))*)a";

// NOT GOOD; attack: "/" + "\\/a".repeat(100)
// Adapted from ANodeBlog (https://github.com/gefangshuai/ANodeBlog),
// which is licensed under the Apache License 2.0; see file ANodeBlog-LICENSE.
String bad4 = "\\/(?![ *])(\\\\\\/|.)*?\\/[gim]*(?=\\W|$)";

// NOT GOOD; attack:  "##".repeat(100) + "\na"
// Adapted from CodeMirror (https://github.com/codemirror/codemirror),
// which is licensed under the MIT license; see file CodeMirror-LICENSE.
String bad5 = "^([\\s\\[\\{\\(]|#.*)*$";

// GOOD
String good4 = "(\\r\\n|\\r|\\n)+";

// GOOD because it cannot be made to fail after the loop (but we can't tell that)
String good5 = "((?:[^\"']|\".*?\"|'.*?')*?)([(,)]|$)";

// NOT GOOD; attack: "a" + "[]".repeat(100) + ".b\n"
// Adapted from Knockout (https://github.com/knockout/knockout), which is
// licensed under the MIT license; see file knockout-LICENSE
String bad6 = "^[\\_$a-z][\\_$a-z0-9]*(\\[.*?\\])*(\\.[\\_$a-z][\\_$a-z0-9]*(\\[.*?\\])*)*$";

// GOOD
String good6 = "(a|.)*";

// NOT GOOD; we cannot detect all of them due to the way we build our NFAs
String bad7 = "^([a-z]+)+$";
String bad8 = "^([a-z]*)*$";
String bad9 = "^([a-zA-Z0-9])(([\\\\-.]|[_]+)?([a-zA-Z0-9]+))*(@){1}[a-z0-9]+[.]{1}(([a-z]{2,3})|([a-z]{2,3}[.]{1}[a-z]{2,3}))$";
String bad10 = "^(([a-z])+.)+[A-Z]([a-z])+$";

// NOT GOOD; attack: "[" + "][".repeat(100) + "]!"
// Adapted from Prototype.js (https://github.com/prototypejs/prototype), which
// is licensed under the MIT license; see file Prototype.js-LICENSE.
String bad11 = "(([\\w#:.~>+()\\s-]+|\\*|\\[.*?\\])+)\\s*(,|$)";

// NOT GOOD; attack: "'" + "\\a".repeat(100) + '"'
// Adapted from Prism (https://github.com/PrismJS/prism), which is licensed
// under the MIT license; see file Prism-LICENSE.
String bad12 = "(\"|')(\\\\?.)*?\\1";

// NOT GOOD
String bad13 = "(b|a?b)*c";

// NOT GOOD
String bad15 = "(a|aa?)*b";

// GOOD
String good7 = "(.|\\n)*!";

// NOT GOOD; attack: "\n".repeat(100) + "."
String bad16 = "(.|\\n)*!";

// GOOD
String good8 = "([\\w.]+)*";

// NOT GOOD
String bad17 = "(a|aa?)*b";

// GOOD - not used as regexp
String good9 = "(a|aa?)*b";

// NOT GOOD
String bad18 = "(([^]|[^a])*)\"";

// GOOD - there is no witness in the end that could cause the regexp to not match
String good10 = "([^\"']+)*";

// NOT GOOD
String bad19 = "((.|[^a])*)\"";

// GOOD
String good11 = "((a|[^a])*)\"";

// NOT GOOD
String bad20 = "((b|[^a])*)\"";

// NOT GOOD
String bad21 = "((G|[^a])*)\"";

// NOT GOOD
String bad22 = "(([0-9]|[^a])*)\"";

// NOT GOOD
String bad23 = "(?:=(?:([!#\\$%&'\\*\\+\\-\\.\\^_`\\|~0-9A-Za-z]+)|\"((?:\\\\[\\x00-\\x7f]|[^\\x00-\\x08\\x0a-\\x1f\\x7f\"])*)\"))?";

// NOT GOOD
String bad24 = "\"((?:\\\\[\\x00-\\x7f]|[^\\x00-\\x08\\x0a-\\x1f\\x7f\"])*)\"";

// GOOD
String bad25 = "\"((?:\\\\[\\x00-\\x7f]|[^\\x00-\\x08\\x0a-\\x1f\\x7f\"\\\\])*)\"";

// NOT GOOD
String bad26 = "(([a-z]|[d-h])*)\"";

// NOT GOOD
String bad27 = "(([^a-z]|[^0-9])*)\"";

// NOT GOOD
String bad28 = "((\\d|[0-9])*)\"";

// NOT GOOD
String bad29 = "((\\s|\\s)*)\"";

// NOT GOOD
String bad30 = "((\\w|G)*)\"";

// GOOD
String good12 = "((\\s|\\d)*)\"";

// NOT GOOD
String bad31 = "((\\d|\\w)*)\"";

// NOT GOOD
String bad32 = "((\\d|5)*)\"";

// NOT GOOD
String bad33 = "((\\s|[\\f])*)\"";

// NOT GOOD
String bad34 = "((\\s|[\\v]|\\\\v)*)\"";

// NOT GOOD
String bad35 = "((\\f|[\\f])*)\"";

// NOT GOOD
String bad36 = "((\\W|\\D)*)\"";

// NOT GOOD
String bad37 = "((\\S|\\w)*)\"";

// NOT GOOD
String bad38 = "((\\S|[\\w])*)\"";

// NOT GOOD
String bad39 = "((1s|[\\da-z])*)\"";

// NOT GOOD
String bad40 = "((0|[\\d])*)\"";

// NOT GOOD
String bad41 = "(([\\d]+)*)\"";

// GOOD - there is no witness in the end that could cause the regexp to not match
String good13 = "(\\d+(X\\d+)?)+";

// GOOD - there is no witness in the end that could cause the regexp to not match
String good14 = "([0-9]+(X[0-9]*)?)*";

// GOOD - but still flagged (always matches something)
String good15 = "^([^>]+)*(>|$)";

// NOT GOOD
String bad43 = "^([^>a]+)*(>|$)";

// NOT GOOD
String bad44 = "(\\n\\s*)+$";

// NOT GOOD
String bad45 = "^(?:\\s+|#.*|\\(\\?#[^)]*\\))*(?:[?*+]|{\\d+(?:,\\d*)?})";

// NOT GOOD
String bad46 = "\\{\\[\\s*([a-zA-Z]+)\\(([a-zA-Z]+)\\)((\\s*([a-zA-Z]+)\\: ?([ a-zA-Z{}]+),?)+)*\\s*\\]\\}";

// NOT GOOD
String bad47 = "(a+|b+|c+)*c";

// NOT GOOD
String bad48 = "(((a+a?)*)+b+)";

// NOT GOOD
String bad49 = "(a+)+bbbb";

// GOOD
String good16 = "(a+)+aaaaa*a+";

// NOT GOOD
String bad50 = "(a+)+aaaaa$";

// GOOD
String good17 = "(\\n+)+\\n\\n";

// NOT GOOD
String bad51 = "(\\n+)+\\n\\n$";

// NOT GOOD
String bad52 = "([^X]+)*$";

// NOT GOOD
String bad53 = "(([^X]b)+)*$";

// GOOD
String good18 = "(([^X]b)+)*($|[^X]b)";

// NOT GOOD
String bad54 = "(([^X]b)+)*($|[^X]c)";

// GOOD
String good20 = "((ab)+)*ababab";

// GOOD
String good21 = "((ab)+)*abab(ab)*(ab)+";

// GOOD
String good22 = "((ab)+)*";

// NOT GOOD
String bad55 = "((ab)+)*$";

// GOOD
String good23 = "((ab)+)*[a1][b1][a2][b2][a3][b3]";

// NOT GOOD
String bad56 = "([\\n\\s]+)*(.)";

// GOOD - any witness passes through the accept state.
String good24 = "(A*A*X)*";

// GOOD
String good26 = "([^\\\\\\]]+)*";

// NOT GOOD
String bad59 = "(\\w*foobarbaz\\w*foobarbaz\\w*foobarbaz\\w*foobarbaz\\s*foobarbaz\\d*foobarbaz\\w*)+-";

// NOT GOOD
String bad60 = "(.thisisagoddamnlongstringforstresstestingthequery|\\sthisisagoddamnlongstringforstresstestingthequery)*-";

// NOT GOOD
String bad61 = "(thisisagoddamnlongstringforstresstestingthequery|this\\w+query)*-";

// GOOD
String good27 = "(thisisagoddamnlongstringforstresstestingthequery|imanotherbutunrelatedstringcomparedtotheotherstring)*-";

// GOOD
String good28 = "foo([\\uDC66\\uDC67]|[\\uDC68\\uDC69])*foo";

// GOOD
String good29 = "foo((\\uDC66|\\uDC67)|(\\uDC68|\\uDC69))*foo";


    Pattern.compile(good1);
    Pattern.compile(good2);
    Pattern.compile(good3);
    Pattern.compile(good4);
    Pattern.compile(good5);
    Pattern.compile(good6);
    Pattern.compile(good7);
    Pattern.compile(good8);
    //Pattern.compile(good9); // exists but to test strings that aren't used as regex
    Pattern.compile(good10);
    Pattern.compile(good11);
    Pattern.compile(good12);
    Pattern.compile(good13);
    Pattern.compile(good14);
    Pattern.compile(good15);
    Pattern.compile(good16);
    Pattern.compile(good17);
    Pattern.compile(good18);
    Pattern.compile(good19);
    Pattern.compile(good20);
    Pattern.compile(good21);
    Pattern.compile(good22);
    Pattern.compile(good23);
    Pattern.compile(good24);
    //Pattern.compile(good25);
    Pattern.compile(good26);
    Pattern.compile(good27);
    Pattern.compile(good28);
    Pattern.compile(good29);

    Pattern.compile(bad1);
    Pattern.compile(bad2);
    Pattern.compile(bad3);
    Pattern.compile(bad4);
    Pattern.compile(bad5);
    Pattern.compile(bad6);
    Pattern.compile(bad7);
    Pattern.compile(bad8);
    Pattern.compile(bad9);
    Pattern.compile(bad10);
    Pattern.compile(bad11);
    Pattern.compile(bad12);
    Pattern.compile(bad13);
    //Pattern.compile(bad14);
    Pattern.compile(bad15);
    Pattern.compile(bad16);
    Pattern.compile(bad17);
    Pattern.compile(bad18);
    Pattern.compile(bad19);
    Pattern.compile(bad20);
    Pattern.compile(bad21);
    Pattern.compile(bad22);
    Pattern.compile(bad23);
    Pattern.compile(bad24);
    Pattern.compile(bad25);
    Pattern.compile(bad26);
    Pattern.compile(bad27);
    Pattern.compile(bad28);
    Pattern.compile(bad29);
    Pattern.compile(bad30);
    Pattern.compile(bad31);
    Pattern.compile(bad32);
    Pattern.compile(bad33);
    Pattern.compile(bad34);
    Pattern.compile(bad35);
    Pattern.compile(bad36);
    Pattern.compile(bad37);
    Pattern.compile(bad38);
    Pattern.compile(bad39);
    Pattern.compile(bad40);
    Pattern.compile(bad41);
    //Pattern.compile(bad42);
    Pattern.compile(bad43);
    Pattern.compile(bad44);
    Pattern.compile(bad45);
    Pattern.compile(bad46);
    Pattern.compile(bad47);
    Pattern.compile(bad48);
    Pattern.compile(bad49);
    Pattern.compile(bad50);
    Pattern.compile(bad51);
    Pattern.compile(bad52);
    Pattern.compile(bad53);
    Pattern.compile(bad54);
    Pattern.compile(bad55);
    Pattern.compile(bad56);
    //Pattern.compile(bad57);
    //Pattern.compile(bad58);
    Pattern.compile(bad59);
    Pattern.compile(bad60);
    Pattern.compile(bad61);
}

}