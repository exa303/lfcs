# Bash

### FILES

* `-a file` - file exists or its compilation is successful
* `-d file` - file exists and is a directory
* `-e file` - file exists; same -a
* `-f file` - file exists and is a regular file (i.e., not a directory or other special type of file)
* `-r file` - you have read permission
* `-s file` - file exists and is not empty
* `-w file` - your have write permission
* `-x file` - you have execute permission on file, or directory search permission if it is a directory
* `-N file` - file was modified since it was last read
* `-O file` - you own file
* `-G file` - file's group ID matches yours (or one of yours, if you are in multiple groups)
* `file1 -nt file2` -file1 is newer than file2
* `file1 -ot file2` -file1 is older than file2

### NUMBERS

* `-lt` - less than
* `-le` - less than or equal
* `-eq` - equal
* `-ge` - greater than or equal
* `-gt` - greater than
* `-ne` - not equal


### STRINGS

* `str1 == str2` - str1 matches str2
* `str1 != str2` - str1 does not match str2
* `str1 < str2` - str1 is less than str2 (alphabetically)
* `str1 > str2` - str1 is greater than str2 (alphabetically)
* `str1 \> str2` - str1 is sorted after str2
* `str1 \< str2` - str1 is sorted before str2
* `-n str1` - str1 is not null (has length greater than 0)
* `-z str1` - str1 is null (has length 0)

### USER INPUT
     
* `read -p "please enter your name: " name
   echo $name`
	* -p prior

### FLAGS with GETOPTS
```bash
#!/bin/bash
while getopts "n:x" opts; do

        case $opts in
                n) name=$OPTARG ;;
                x) echo "the x has been selected";;
        esac
done

echo "hello $name"
```

### OTHER:

* `command && command && command` - Using one & (ampersand) to run commands simultaneously

* `$$` - is the process ID (PID) of the script itself. $BASHPID is the process ID of the current instance of Bash.

* `trap <function name / "or entire command"> <SIGNAL>` - trap execution of a function name or entire command until the SIGNAL is received.
        * `trap -l` - lists all possible signals. In bash scripts you can use `EXIT` signal to trap execution until script exits. It is similar to `defer` in golang.

* `seq 1 10` - start step stop , it can be used in bash scripting in for loop for example:
        
```bash
        for a in `seq 1 10`; do
                echo $a
        done

```
