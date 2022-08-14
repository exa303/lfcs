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

