# FLOW CONTROLS

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

---     

* `read -p "please enter your name: " name
   echo $name`
	* -p prior

### OTHER:
* `command && command && command` - Using & (ampersand) to run commands simultaneously
