• '[address]s/pattern/replacement/flag' - Address is to mach occurrence at that line and the second is a pattern to make a substitution. 

• 'g/address/s/replace_frim/to/g' - replace all occurrence on all lines. 

**Note:** g at the begining means address all occurrences in a text, g at the end means target all occurrences on a line. 

## Execute script:
• 'sed -f script_file input_file'

## Multiple instruction specification.
3 ways. 
1st Using shells '\'. 

• 'sed 's/one/other/g; s/one/other/g' file.txt' - 2nd Using ';'.

• 'sed 's/one/other/g -e s/one/other/g' file.txt' - 3rd Using '-e' command.