# Sed 
Stream editor.

Syntax:
* `sed [options]…  [script] [file]`
	* If no filename is provided with `sed` command, then the script will work on standard input data. The `sed` script can be executed without any option.

### Examples:

* `echo "Bash Scripting Language" | sed 's/Bash/Perl/'` 
	* Basic text substitution, changes Bash to Perl.
* `sed '2 s/Python/perl/g' python.txt` - everything on second line will be changed from Python to perl.
	* ‘g’ option is used in `sed` command to replace all occurrences of matching pattern. 
	* 2 is a line that takes effect on.
