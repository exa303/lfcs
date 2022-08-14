## Basic substitution

• `[address]/s/pattern/replacement/flag` - Address is to mach occurrence at that line and the second is a pattern to make a substitution. 

• `g/address/s/replace_frim/to/g` - replace all occurrence on all lines. 

**Note:** g at the begining means address all occurrences in a text, g at the end means target all occurrences on a line. 


## Multiple instruction specification.
3 ways. 
1st Using shells `\`. 

• `sed 's/one/other/g; s/one/other/g' file.txt` - 2nd Using `;`.
• `sed 's/one/other/g -e s/one/other/g' file.txt` - 3rd Using `-e` command.

## Print only affected lines

* `sed -n 's/Android/UNIX/p' text.txt` - `-n` suppresses output `p` print directive. 

## Execute script:
• `sed -f script_file input_file`

Script file `nameState` :
```bash
s/ CA/, California/
s/ MA/, Massachusetts/
s/ OK/, Oklahoma/
s/ PA/, Pennsylvania/
s/ VA/, Virginia/

```
then run a script file against dataset -> `sed -f nameState text3.txt`



## Deleting

* `d` - delete all
* `1d` - delete first line
* `$d` - delete last line
* `/^$/d` - deleted all newlines
* `sed '2,$d'` - delete ewerything from line 2 to the last line, if you want to delete ewerything from first line just type 1 , `^` doesn't work.
* `1,/ˆ$/d` - This example deletes from the first line up to the first blank line, which, for instance, will delete a mailer header from an Internet mail message that you have saved in a file. 
* `sed '/text1/,/text2/d' ` - deletes from one address to another. 
* `sed '1d; $d;'` - deletes first and last lines.
* `cat d.txt | sed -n 's/Linux/Android/p'` - when `-n` flag specified it only prints using `p` directive. 
* `/ˆ\*\**\*$/d` - This command deletes entire lines of asterisks anywhere they occur in the file.


## Substitution
* `[ address ]s/ pattern / replacement / flags`
where the flags that modify the substitution are:
* `n` A number (1 to 512) indicating that a replacement should be made for only
the n th occurrence of the patter n.
* `g` Make changes globally on all occurrences in the pattern space. Normally only
the first occurrence is replaced.
* `p` Print the contents of the pattern space.
* `w` file
Write the contents of the pattern space to file.

* `s/•/>/2` - will change second tab to a `>`.
* `sed 's/Linux/(&)/'` - the output is going to be `(Linux)`. `&` The ampersand makes it possible to refer ence the entire match in the replacement string.
* Select strings/regex's using `()` and recall them later in substitution using using `\n` where n is up to 9 saves. 
    ``` bash
    $ cat test1
    first:second
    one:two
    $ sed ’s/\(.*\):\(.*\)/\2:\1/’ test1
    second:first
    two:one
    ```

* extract filename from `home/root/dir/file.txt` pathname. `sed 's/.*\///'`
* `$ sed -e 's/\(.*\)/\L\1/' input.txt > output.txt` - Converts upper to lower case 
* `$ sed -e 's/\(.*\)/\U\1/' input.txt > output.txt` - Converts lower to upper case

## Comments
* `# wstar.sed: convert WordStar files` - comments using `#`

## Append, Insert, and Change


The append (a), insert (i), and change (c) commands, The syntax follows:
* append [ line-address ]a\ text  - `sed '/Linux/a\androd'` - The append and insert commands can be applied only to a single line address, not a range of lines.


* insert [ line-address ]i\ Vtext - `sed '/Linux/i\androd'`
* change [ address ]c\ text - `sed '/Linux/c\androd'` - `/ˆFrom /,/ˆ$/c\<Mail Header Removed>`- From until it reaches empty line.
    ```bash
        cat change.txt | sed '/^\.sp/c\\.sp 14'
        .sp 14
        .sp 14
        .sp 14
        .sp 14
        .sp 14
        .sp 14
        1.5
        1
        1.5v
        .3v
        3

    ```
## = line number 
* `cat file.c | sed -n '/if/='` - returns line numbers of if statements

## Hold Space

* Hold h or H - Copy or append contents of pattern space to hold space. 
* Get g or G - Copy or append contents of hold space to pattern space.
* Exchange - Swap contents of hold space and pattern space.

    ```bash
    1
    2
    11
    22
    111
    222

    script file:
    # Reverse flip
    /1/{
    h
    d
    }
    /2/{
    G
    }

    ```




