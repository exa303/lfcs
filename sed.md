# Sed 
Stream editor.

Syntax:
* `sed [options]…  [script] [file]`
	* If no filename is provided with `sed` command, then the script will work on standard input data. The `sed` script can be executed without any option.

### Examples:

* `echo "Bash Scripting Language" | sed 's/Bash/Perl/'` 
	* Basic text substitution, changes Bash to Perl.
* `sed '2 s/Python/perl/g' python.txt` - everything on second line will be changed from Python to perl.
	* ‘g’ option is used in `sed` command to replace all occurrences of matching pattern. If you dont use 'g' it will affect only first word in second line.
	* 2 is a line that takes effect on.
* `2 s/Python/perl/2' python.txt` - second line, second word Python will change to perl.
* `sed -e '$s/Python/perl/g' text.txt` - last line on a file will get all Python words replaced to perl. `$` by s is expression to the last.
* `sed -n '3,3p' text.txt` - print 3 line of a text.txt file. `sed -n '$p' text.txt` - same result  
