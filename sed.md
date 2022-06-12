# Sed 
Stream editor.

Syntax:
* `sed [options]…  [script] [file]`
	* If no filename is provided with `sed` command, then the script will work on standard input data. The `sed` script can be executed without any option.
Examples:

* `echo "Bash Scripting Language" | sed 's/Bash/Perl/'` 
	* Basic text substitution, changes Bash to Perl.
