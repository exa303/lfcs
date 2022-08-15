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

* `if ( x ~ /[yY](es)?/ ) print x` - whether x matches a pattern using the pattern-matching operator `~`
    
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







