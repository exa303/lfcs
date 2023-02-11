# List, set, and change standard ugo/rwx permissions.

### Conversions

```
r (read) = 4
w (write) = 2
x (execute) = 1
```


Each set of 3 spaces equates to a different permission set. For instance:
```
d			rwx					rwx					rwx
file type 	user permissions 	group permissions 	other permissions
```

* `chmod 755 <filename or dir>`  - Command


## Setting Special Permissions

* There are also 3 special types of permission that you can set as well. The 3 types are SUID, SGID, and the Sticky Bit.
The SUID bit, if set, allows you to have certain programs always run as the user owner. For instance, if I need a particular program toalways run as root regardless of the user that I’m currently logged in as I would do the following.

	* `chmod 4755 /usr/bin/program_here`
	

* The above command sets the regular permissions as well as the SUID special bit in front. SUID is represented by the number 4.
The SGID bit, if set on a directory forces each file that is created under that directory to be owned by the group of the primarydirectory. You can also set the SGID on a program to run that program as if you’re apart of that programs group. Below is an example foretting the SGID on our /test directory.

	* `chmod 2775 /test`


* The above command will now automatically assign any file to the group owner of the primary directory set with the SGID.
The Sticky bit, should only be set on a directory. When set on a directory other users cannot delete or rename the files and/or subdirectories within that directory. Only the owner and the root user can delete and rename the files and directories within that directory. Below is an example for setting the sticky bit on our /test directory.

	* `chmod 1755 /test`

--- 
## Simplification

## Sticky:

* `chmod +t <file or directory>` - To set the sticky bit on a file or directory, you can use the "chmod" command and add the "+t" option, followed by the name of the file or directory

* `chmod -t <file or directory>` - To remove the sticky bit, you can use the "chmod" command and add the "-t" option:

## SUID

* `chmod +s <file>` - To set the SUID on a file, you can use the "chmod" command and add the "+s" option, followed by the name of the file.
* `chmod -s <file>` - To remove the SUID, you can use the "chmod" command and add the "-s" option.

## SGID

* `chmod g+s <directory>` - To add the SGID bit to a directory, you can use the "chmod" command and specify the numeric permission value for the directory. The numeric permission value for SGID is 2 (binary 10).

* `chmod g-s <directory>` - To remove the SGID bit from a directory, you can use the same "chmod" command and specify the numeric permission value for the directory. However, instead of the "+s" symbol, you would use the "-" symbol. 









	
	


