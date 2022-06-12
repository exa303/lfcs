# Find

* `find . `  - . represents working dir.
* `find . -name test.txt` - finds test.txt
* `find . -type d -name Documents` -  find directorie/s Documents in this working directory
* `find . -type f -name "*.php"` - find all php files in this directory
* `find . -type f -perm 0664 -print` - find all files with 664 permission
* `find / -type f ! -perm 777` - exclude, ! negetion
* `find / -perm /u=s` - Find all SUID set files.
* `find / -perm /g=s` - Find all SGID set files.
* `find . -type f -perm /a=x` - Find all executable files (/a=x  / need to use this to escape)
* `find / -type f -perm 0777 -print -exec chmod 644 {} \;` - chmod to 0644 DON'T FORGET `\;`
### -exec
* `find /path [args] -exec [cmd] {} \`;
* `{}` Is a placeholder for the result found by find
* `\;` Says that for each found result, the command cmd is executed once with the found result.
* It is executed like this: cmd result1 result2 … result N



