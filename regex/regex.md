# Regex

## Metacharacters 

* `. ` - Matches any single character except newline. In awk, dot can match newline
also.
* `*` - Matches any number (including zero) of the single character (including a
character specified by a regular expression) that immediately precedes it.
* `[...]` Matches any one of the class of characters enclosed between the brackets. A
circumflex `(ˆ)` as first character inside brackets reverses the match to all
characters except newline and those listed in the class. In awk, newline will
also match. A hyphen `(-)` is used to indicate a range of characters. The close
bracket `(])` as the first character in class is a member of the class. All other
metacharacters lose their meaning when specified as members of a class.
* `ˆ` First character of regular expression, matches the beginning of the line.
Matches the beginning of a string in awk, even if the string contains
embedded newlines.
* `$` As last character of regular expression, matches the end of the line. Matches
the end of a string in awk, even if the string contains embedded newlines.
* `\{n,m\}` Matches a range of occurrences of the single character (including a character
specified by a regular expression) that immediately precedes it. `\{n\}` will
match exactly n occurr ences, `\{n,\}` will match at least n occurr ences, and
`\{n,m\}` will match any number of occurrences between n and m. (sed and
gr ep only, may not be in some very old versions.)
* `\` Escapes the special character that follows.

## Extended metacharacters

* `+` - Matches one or more occurr ences of the preceding regular expression.
* `?` - Matches zero or one occurrences of the preceding regular expression.
* `|` - Specifies that either the preceding or following regular expression can be
matched (alternation).
* `()` - Groups regular expressions
* `{n,m}` - Matches a range of occurrences of the single character (including a character
specified by a regular expression) that immediately precedes it. `{n}` will match
exactly n occurr ences, `{n,}` will match at least n occurr ences, and `{n,m}` will
match any number of occurrences between n and m. (POSIX egrep and
POSIX awk, not in traditional egrep or awk.)

## A wild card
The wildcar d metacharacter, or dot `(.)`, might be considered equivalent to a vari-
able. A variable repr esents any value in an arithmetic expression. In a regular
expr ession, a dot `(.)` is a wildcard that repr esents any character except the new-
line.
* `80.86` matches: “80286,” “80386,” or “80486”.

## Character Classes

* `[Ww]hat` - matches “what” or “What.” It will match any line that
contains this four-character string, the first character of which is either “W” or “w.”
Ther efor e, it could match “Whatever” or “somewhat.” 

```bash
$ cat text.txt | grep "[Ll]inux"
Linux is here
linux is ewerywhere
```

```bash
grep ’\.H[123]’ ch0[12]
ch01:.H1 "Contents of Distribution Tape"
ch01:.H1 "Installing the Software"
ch01:.H1 "Configuring the System"
ch01:.H2 "Specifying Input Devices"
ch01:.H3 "Using the Touch Screen"
ch01:.H3 "Using the Mouse"
ch01:.H2 "Specifying Printers"
ch02:.H1 "Getting Started"
ch02:.H2 "A Quick Tour"
```

### Special characters in character classes

* `\` Escapes any special character (awk only).
* `-` Indicates a range when not in the first or last position.
* `ˆ` Indicates a reverse match only when in the first position.


### A range of characters

* `[A-Z]` - range of all uppercase English letters.
* `[0-9]` - range of digits

* `[0-9a-z?,.;:’"]` - This expression will match “any single character that is numeric, lowercase alpha-
betic, or a question mark, comma, period, semicolon, colon, single quote, or quo-
tation mark.”

* `[a-zA-Z][.?!]` - This expression will match “any lowercase or uppercase letter followed by either a
period, a question mark, or an exclamation mark.”

* `[0-1][0-9][-/][0-3][0-9][-/][0-9][0-9]` - Either “-” or “/” could be the delimiter. Putting the hyphen in the first position ensur es that it will be interpreted in a character class literally, as a hyphen, and
not as indicating a range. Matches: `MM-DD-YY or MM/DD/YY`

### Excluding a class of characters

* `[ˆ0-9]` - The circumflex (ˆ) as the first character in the class excludes all of
the characters in the class from being matched.

* `\.DS "[ˆ1]"` - This expression matches the string “.DS” followed by a space, a quote followed by
any character other than the number “1,” followed by a quote.


## POSIX character class additions


* `[:alnum:]` - Printable characters (includes whitespace)
* `[:alpha:]` - Alphabetic characters
* `[:blank:]` - Space and tab characters
* `[:cntrl:]` - Control characters
* `[:digit:]` - Numeric characters
* `[:graph:]` - Printable and visible (non-space) characters
* `[:lower:]` - Lowercase characters
* `[:print:]` - Printable characters (includes whitespace)
* `[:punct:]` - Punctuation characters
* `[:space:]` - Whitespace characters
* `[:upper:]` - Uppercase characters
* `[:xdigit:]` - Hexadecimal digits

* `sed '/^$/d' <input-file>` -  remove empty lines

## A Span of Characters

`\{n,m\}`- n and m ar e integers between 0 and 255. If you specify `\{n\}` by itself, then exactly n occurrences of the preceding character or regular expression will be matched. If you specify `\{n,\}`, then at least n occurr ences will be matched. If you specify `\{n,m\}`, then any number of occurrences between n and m will be matched.

* `10\{2,4\}1` - following expression will match “1001,” “10001,” and “100001” but NOT “101” or “1000001”
* `grep "T[RB][1-9]\{1\}0[1-9]\{1\}"` - output will match `TR909` and `TB303`

## The vertical bar (|) 
* `egrep "UNIX|LINUX" ` - matches one or the other or both.
* `egrep "compan(y|ies)"` - matches company or companies. 

# Examples

* `egrep '^[abc]+' date.txt`

```bash
abcdefg
abcde
abc
```
