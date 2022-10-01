# Hexdump
* `hexdump -x sample.txt` - To display file contents in hexadecimal format(hexdump -x file_path):



* To display file contents in decimal format(hexdump -d file_path):
    * hexdump -d sample.txt 

* To display file contents in octal format(hexdump -o file_path):
    * hexdump -o sample.txt 

* To display file contents in octal format byte by byte(hexdump -b file_path):
    * hexdump -b sample.txt

* To display file contents in character display format(hexdump -c file_path):
    *  hexdump -c sample.txt 

* To dump only specified bytes from input file(hexdump -s num_to_skip -[option] file_path):
    * hexdump -s 1 -c  sample.txt 

