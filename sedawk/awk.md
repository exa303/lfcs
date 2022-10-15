* In awk, you can write two statements in one line separated by ;(semi-colon)

* `{ num_gold++; wt_gold += $2 }`

Otherwize, you should put them into separated lines:

```bash
{
    num_gold++
    wt_gold += $2
}
```


## Regula expressions with //

* `awk '/MA/' text2.txt` - matches ewery line that has "MA" in it.

## Change field separator

* `-F` - this changes field separator
    * `awk -F, '{ print $1 }' text2.txt`


## Script file can match multiple rules

    ```bash
    # contents of test.awk   
    /[0-9]+/{ print "That is an integer" }
    /[A-Za-z]+/ { print "This is a string" }
    /ˆ$/ { print "string or empty line." }

    ```
## Define Field Separator in script

    ```bash
    # phonelist.awk -- print name and phone number.
    # input file -- name, company, street, city, state and zip, phone
    BEGIN { FS = "," } # comma-delimited fields
    { print $1 ", " $6 }

    ```
## ~ operator

* `$5  ̃ /MA/ { print $1 ", " $6 }` - test a specific field for a match. The tilde `(~)` operator allows you to test a regular expression against a field.
* `$5 ! ̃ /MA/ { print $1 ", " $6 }` - you can reverse the meaning of the rule by using bang-tilde.

## Variables

A variable is an identifier that refer ences a value. To define a variable, you only
have to name it and assign it a value. The name can only contain letters, digits,
and underscores, and may not start with a digit. Case distinctions in variable
names are important: Salar y and salar y ar e two differ ent variables. Variables are
not declared; you do not have to tell awk what type of value will be stored in a
variable. Each variable has a string value and a numeric value, and awk uses the
appr opriate value based on the context of the expression. (Strings that do not con-
sist of numbers have a numeric value of 0.) Variables do not have to be initialized;


## System variables

* `NF` - number of fields
* `FS` - field separator. Recommended to set it at the begining of script `BEGIN { FS = ";"}`
* `RS` - record separator (by default new line)
* `NR` - number of rows 
* `FILENAME` - contains the name of the current input file.
* `FNR` - multiple input files are used as it provides the number of the current record relative to the current input file.
    * Typically, the field and record separators are defined in the BEGIN pr ocedure because you want these values set before the first input line is read. However, you can redefine these values anywhere in the script. In POSIX awk, assigning a new value to FS has no effect on the current input line; it only affects the next input line.

    ```bash
    print NR ".", $1, avg
    
    #output:
    1. john 87.4
    2. andrea 86
    3. jasper 85.6
    ```

### Example

```bash
# balance.txt:
1000;
125;Market;-125.45
126;Hardware Store;-34.95
127;Video Store;-20.00
128;Car;-100.00

#balance.awk:

BEGIN { FS=";" }
NR == 1 { 
    print "Begining of balance: " $1 
    balance = $1
}

NR >= 2 {   
    print $1,$2,$3 
    balance +=$3 
    print "Balance: " balance

}


awk -f balance.awk balance.txt

#output:
Begining of balance: 1000
125 Market -125.45
Balance:874.55
126 Hardware Store -34.95
Balance:839.6
127 Video Store -20.00
Balance:819.6
128 Car -100.00
Balance:719.6

```

## Relational and Boolean Operators

* `(NR > 1 && NF >= 2) || $1 ~ /\t/` - both of the expressions in parentheses must be true or the right
hand side must be true.
* `NR > 1 && (NF >= 2 || $1  ̃ /\t/)` - The first condition must be true and either of two other conditions must be true.

* `! (NR > 1 && NF > 3)` - This expression is true if the parenthesized expression is false.

* `find . -type f -ls $* | awk '{size+=$1} END {print size/(1024*1024) "K"}'` - calculates size of directory

## Passing Parameters  Into a Script

* syntax: `awk ’script’ var=value inputfile` 
    * `$ awk -f scriptfile high=100 low=60 datafile` - dereference variable inside the script simple using `high`


## Conditional Statements

* `if ( x ~ /[yY](es)?/ ) print x` - whether x matches a pattern using the pattern-matching operator `~` , `In awk, the format is $target ~ /$regex/, so $1 ~ /[A-Za-z]/.`
    
* If any action consists of more than one statement, the action is enclosed within a pair of braces.
    ``` bash
   if ( expression ) {
    statement1
    statement2
    }

    #

    if ( avg >= 65 )
    grade = "Pass"
    else
    grade = "Fail"

    if (avg >= 90) grade = "A"
    else if (avg >= 80) grade = "B"
    else if (avg >= 70) grade = "C"
    else if (avg >= 60) grade = "D"
    else grade = "F"

    # ternary 

    grade = (avg >= 65) ? "Pass" : "Fail"

    # nested

    if ( expression ) {
        if ( expression )
            do that
        else
            do other
    }


    ```


## Looping

```bash
# While

i = 1
while ( i <= 4 ) {
print $i
++i
}

# Do while

BEGIN {
do {
++x
print x
} while ( x <= 4 )
}

#For

for ( i = 1; i <= NF; i++ )
print $i

```

# Flow Control

```bash

# Break

for ( x = 1; x <= NF; ++x )
if ( y == $x ) {
print x, $x
break
}
print


```

```bash

#continue 


for ( x = 1; x <= NF; ++x ) {
if ( x == 3 )
continue
print x, $x
}

```
* This example loops through the fields of the current input record, printing the
field number and its value. However (for some reason), we want to avoid printing
the third field. The conditional statement tests the counter variable and if it is
equal to 3, the continue statement is executed.



## next
```bash

No      Item_Name               Price           Quantity
1       Mangoes                 $3.45              5
2       Apples                  $2.45              25
3       Pineapples              $4.45              55
4       Tomatoes                $3.45              25
5       Onions                  $1.45              15
6       Bananas                 $3.45              30

````
* Consider running the following command that will flag food items whose quantity is less than or equal to 20 with a (*) sign at the end of each line:

```bash
 awk '$4 <= 20 { printf "%s\t%s\n", $0,"*" ; } $4 > 20 { print $0 ;} ' food_list.txt 

No  Item_Name       Price       Quantity
1   Mangoes         $3.45               5    *
2   Apples          $2.45              25
3   Pineapples      $4.45              55
4   Tomatoes        $3.45              25 
5   Onions          $1.45              15    *
6   Bananas         $3.45              30
```
* But there is one problem here, when the first expression is executed, a line that we want to flag is printed using: { printf "%s\t%s\n", $0,"**" ; } and then in the same step, the second expression is also checked which becomes a time wasting factor.

So there is no need to execute the second expression, $4 > 20 again after printing already flagged lines that have been printed using the first expression.
To deal with this problem, you have to use the next command as follows:
    
```bash
awk '$4 <= 20 { printf "%s\t%s\n", $0,"*" ; next; } $4 > 20 { print $0 ;} ' food_list.txt

No  Item_Name       Price       Quantity
1   Mangoes         $3.45              5    *
2   Apples          $2.45              25
3   Pineapples      $4.45              55
4   Tomatoes        $3.45              25 
5   Onions          $1.45              15   *
6   Bananas         $3.45              30

```
* After a single input line is printed using $4 <= 20 { printf "%s\t%s\n", $0,"*" ; next ; }, the next command included will help skip the second expression $4 > 20 { print $0 ;}, so execution goes to the next input line without having to waste time on checking whether the quantity is greater than 20.



## exit
* An exit statement can take an expression as an argument. The value of this expression will be returned as the exit status of awk. If the expression is not supplied, the exit status is 0. If you supply a value to an initial exit statement, and then call exit again from the END rule without a value, the first value is used. For example:

```bash
awk ’{
...
exit 5
}
END { exit }’
Here, the exit status from awk will be 5.

```
## Arrays

* `flavor[1] = "cherry"` - syntax.
* `print flavor[1]` - get the value.
* `if (arr[$1] < 1)` - check if associative array with index $1 stores any value.
* Appending to arrays [append](/sedawk/examples/awkexamples.md#6-appendto-array)

```bash
flavor_count = 5
for (x = 1; x <= flavor_count; ++x)
print flavor[x]
```

* In awk, all arrays are associative arrays. What makes an associative array unique is that its index can be a string or a number `acro["BASIC"]`.

### There is a special looping syntax for accessing all the elements of an associative array. It is a version of the for loop.

```bash
for ( item in acro )
print item, acro[item]
```
* [example](/sedawk/examples/awkexamples.md#7-testing-for-membership-in-an-array)


## Testing for Membership in an Array


* The keyword in is also an operator that can be used in a conditional expression to test that a subscript is a member of an array. 

```bash
if ( "BASIC" in acro )
print "Found BASIC"
```
* This is true if “BASIC” is a subscript used to access an element of acro. This syntax cannot tell you whether “BASIC” is the value of an element of acro. This expression is the same as writing a loop to check that such a subscript exists, although the above expression is much easier to write, and much more efficient to execute.



## Lookup script example:

```bash
awk ’# lookup -- reads local glossary file and prompts user for query
#0
BEGIN { FS = "\t"; OFS = "\t"
# prompt user
printf("Enter a glossary term: ")
}
#1 read local file named glossary
FILENAME == "glossary" {
# load each glossary entry into an array
entry[$1] = $2
next
}
#2 scan for command to exit program
$0  ̃ /ˆ(quit|[qQ]|exit|[Xx])$/ { exit }
#3 process any non-empty line
$0 != "" {
if ( $0 in entry ) {
# it is there, print definition
print entry[$0]
} else
print $0 " not found"
}Ar rays
189
#4 prompt user again for another term
{
printf("Enter another glossary term (q to quit): ")
}’ glossary -
```
This program reads a series of glossary entries from a file named glossary and puts them into an array. The user is prompted to enter a glossary term and if it is found, the definition of the term is printed.
The pattern-matching rules are number ed to make this discussion easier. As we
look at the individual rules, we’ll discuss them in the order in which they are
encounter ed in the flow of the script. Rule #0 is the BEGIN rule, which is per-
for med only once before any input is read. It sets FS and OFS to a tab and then
pr ompts the user to enter a glossary item. The response will come from standard
input, but that is read after the glossary file.
Rule #1 tests to see if the current filename (the value of FILENAME) is “glossary”
and is therefor e only applied while reading input from this file. This rule loads the
glossary entries into an array:
entry[term] = definition
wher e $1 is the term and $2 is the definition. The next statement at the end of rule
#1 is used to skip other rules in the script and causes a new line of input to be
read. So, until all the entries in the glossary file are read, no other rule is evalu-
ated.
Once input from glossary is exhausted, awk reads from standard input because “-”
is specified on the command line. Standard input is where the user’s response
comes from. Rule #3 tests that the input line ($0) is not empty. This rule should
match whatever the user types. The action uses in to see if the input line is an
index in the array. If it is, it simply prints out the corresponding value. Otherwise,
we tell the user that no valid entry was found.
After rule #3, rule #4 will be evaluated. This rule simply prompts the user for
another entry. Note that regardless of whether a valid entry was processed in rule
#3, rule #4 is executed. The prompt also tells the user how to quit the program.
After this rule, awk looks for the next line of input.
If the user chooses to quit by entering “q” as the next line of input, rule #2 will be
matched. The pattern looks for a complete line consisting of alternative words or
single letters that the user might enter to quit. The “ˆ” and “$” are important, signi-
fying that the input line contains no other characters but these; otherwise a “q”
appearing in a glossary entry would be matched. Note that the placement of this
rule in the sequence of rules is significant. It must appear before rules #3 and #4
because these rules will match anything, including the words “quit” and “exit.”

## split()

```bash
z = split($1, array, " ")
for (i = 1; i <= z; ++i)
print i, array[i]

```


The split (str, arr, regex) function

The split function splits the str string using a field separator specified using regex and stores it into the arr array. It returns the number of array elements created on splitting the string. If no separator is specified, then the string is split using the current field separator (FS) value.



* z contains the number of elements in the array.

```bash
awk ’
# date-month -- convert mm/dd/yy or mm-dd-yy to month day, year
# build list of months and put in array.
BEGIN {
# the 3-step assignment is done for printing in book
listmonths = "January,February,March,April,May,June,"
listmonths = listmonths "July,August,September,"
listmonths = listmonths "October,November,December"
split(listmonths, month, ",")
}
# check that there is input
$1 != "" {
# split on "/" the first input field into elements of array
sizeOfArray = split($1, date, "/")
# check that only one field is returned
if (sizeOfArray == 1)
# try to split on "-"
sizeOfArray = split($1, date, "-")
# must be invalid
if (sizeOfArray == 1)
exit
# add 0 to number of month to coerce numeric type
date[1] += 0
# print month day, year
print month[date[1]], (date[2] ", 19" date[3])
}’
```
* Following along on the same idea, here’s a script that converts dates in the form “mm-dd-yy” or “mm/dd/yy” to “month day, year.” `$ echo "5/11/55" | date-month.awk       returns: May 11, 1955`

##  Deleting Elements of an Array
* `delete array [ subscript ]`


## Factorial example:

```bash

awk ’# factorial: return factorial of user-supplied number
BEGIN {
# prompt user; use printf, not print, to avoid the newline
printf("Enter number: ")
}
# check that user enters a number
$1  ̃ /ˆ[0-9]+$/ {
# assign value of $1 to number & fact
number = $1
if (number == 0)
fact = 1
else
fact = number
# loop to multiply fact*x until x = 1
for (x = number - 1; x > 1; x--)
fact *= x
printf("The factorial of %d is %g\n", number, fact)
# exit -- saves user from typing CRTL-D.
exit
}
# if not a number, prompt again.
{ printf(" \nInvalid entry. Enter a number: ")
}’ -
````



## System Variables That Are Arrays

Awk provides two system variables that are arrays:
* ARGV
    * An array of command-line arguments, excluding the script itself and any
options specified with the invocation of awk. The number of elements in this
array is available in ARGC. The index of the first element of the array is 0
(unlike all other arrays in awk but consistent with C) and the last is ARGC - 1.
* ENVIRON
    * An array of environment variables. Each element of the array is the value in
the current environment and the index is the name of the environment vari-
able.

* You can write a loop to refer ence all the elements of the ARGV array.
```bash 
# argv.awk - print command-line parameters
BEGIN { for (x = 0; x < ARGC; ++x)
print ARGV[x]
print ARGC
}
```


Remember that if you invoke awk from a shell script, the command-line parame-
ters are passed to the shell script and not to awk. You have to pass the shell
script’s command-line parameters to the awk program inside the shell script. For
instance, you can pass all command-line parameters from the shell script to awk,
using “$*”. Look at the following shell script:

```bash
awk ’
# argv.sh - print command-line parameters
BEGIN {
for (x = 0; x < ARGC; ++x)
print ARGV[x]
print ARGC
}’ $*



# number.awk - test command-line parameters
BEGIN {
for (x = 1; x < ARGC; ++x)
if ( ARGV[x] ! ̃ /ˆ[0-9]+$/ ) {
print ARGV[x], "is not an integer."
exit 1
}
}


```

## An Array of Environment Variables

```bash
# environ.awk - print environment variable
BEGIN {
for (env in ENVIRON)
print env "=" ENVIRON[env]
}


## output

DISPLAY=scribe:0.0
FRAME=Shell 3
LOGNAME=dale
MAIL=/usr/mail/dale
PATH=:/bin:/usr/bin:/usr/ucb:/work/bin:/mac/bin:.
TERM=mac2cs
HOME=/work/dale
SHELL=/bin/csh
TZ=PST8PDT
EDITOR=/usr/bin/vi

```

# Functions

* `int(x)` Returns truncated value of `x`.
* `srand(x)` - Establishes new seed for rand( ). If no seed is specified, uses time of day. Returns the old seed.
* `split(s,a,sep)` - Parses strings into elements of array a using field separator sep; returns number of elements. If sep is not supplied, FS is used. Array
splitting works the same way as field splitting.
* `index(s,t)` - Returns position of substring t in string s or zero if not present.
* `length(s)` - Returns length of string s or length of $0 if no string is supplied.
* `tolower(s)` - Translates all uppercase characters in string s to lowercase and returns the new string.
* `toupper(s)` - Translates all lowercase characters in string s to uppercase and returns the new string.
* `match( )` - match("the UNIX operating system", /[A-Z]+/) - The value returned by this function is 5, the character position of “U,” the first capital letter in the string.
 
## Random Number Generation

The rand( ) function generates a pseudo-random floating-point number between 0
and 1. The srand( ) function sets the seed or starting point for random number
generation. If srand( ) is called without an argument, it uses the time of day to gen-
erate the seed. With an argument x, srand( ) uses x as the seed. 

## User functions

* A function definition can be placed anywhere in a script that a pattern-action rule
can appear. Typically, we put the function definitions at the top of the script
befor e the pattern-action rules. A function is defined using the following syntax:

``` bash
function name (parameter-list) {
statements

return
}

```
variables defined in the body of the function are global variables, by
default.

Example:

```bash
#!/usr/bin/awk -f

function n(x){
        print x
        }

BEGIN{
    print "AWK Script"
    n(ARGV[1])

}

```
```bash
BEGIN { printf "Enter your name: "
getline < "-"
print
}

#Assign input to a Variable

BEGIN { printf "Enter your name: "
getline name < "-"
print name
}

```

## The system() Function
The system( ) function executes a command supplied as an expression. * It does
not, however, make the output of the command available within the program for
processing. It returns the exit status of the command that was executed. The script
waits for the command to finish before continuing execution.


```bash

BEGIN { if (system("mkdir dale") != 0)
print "Command Failed" }


```


## Pipes

This is simple example of awk pipes. Do not forget to close the pipe, becouse you will run out eventualy.

```bash
#!/usr/bin/awk -f

{
        "pwd" | getline
        close(pwd) 
        print $0 # the value from getline is placed here
        exit

        }

```

## Pass variable from commandline

* `awk -v var1="$col1" -v var2="$col2" 'BEGIN {print var1,var2 }'`


