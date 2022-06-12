# Find

### -exec
`find /path [args] -exec [cmd] {} \`;
`{}` Is a placeholder for the result found by find.
`\;` Says that for each found result, the command cmd is executed once with the found result.
It is executed like this: cmd result1 result2 … result N.
###

* `find . `  - . represents working dir.
* `find . -name test.txt` - finds test.txt
* `find . -type d -name Documents` -  find directorie/s Documents in this working directory.
* `find . -type f -name "*.php"` - find all php files in this directory.
* `find . -type f -perm 0664 -print` - find all files with 664 permission.
* `find / -type f ! -perm 777` - exclude, ! negetion
* `find / -perm /u=s` - Find all SUID set files.
* `find / -perm /g=s` - Find all SGID set files.
* `find . -type f -perm /a=x` - Find all executable files (/a=x  / need to use this to escape bash interpretation).
* `find / -type f -perm 0777 -print -exec chmod 644 {} \;` - chmod to 0644 DON'T FORGET ` \;` with space before it.
* `find . -type f -perm /a=x -exec rm -f {} \;` - find executable and remove it.
* `find . -type f -name "*.txt" -exec rm -f {} \;` - find and remove multiple files.
* `find . -type f -empty` - find empty files.
* `find . -type f -empty -exec rm -f {} \;` - find end remove empty files.
* `find . -type f -name ".*"` - find all hidden files.
* `find . -type f -name "somefile.txt" -user root` - find single file based on User.
* `find . -type f -user root` - find all files of root user.
* `find . -type f -group dev` - find files that belong to dev group.
* `find . -type f -mtime 50` - files that are SPECIFICALY modified 50 days back. 
* `find . -type f -mtime -50` - files that are modifies in last 50 days.
* `find / -atime -50` - files that are accessed in last 50 days.
* `find ./ ! -mtime -20` - files that have NOT (!) been modified past 20 days.
* `find / -mtime +50 –mtime -100` - To find all the files which are modified more than 50 days back and less than 100 days.
* `find / -cmin -60` - To find all the files which are changed in the last 1 hour.
* `find / -mmin -60` - To find all the files which are modified in the last 1 hour.
* `find / -amin -60` - To find all the files which are accessed in the last 1 hour.
* `find / -size 50M` - To find all 50MB files, use.
* `find / -size +50M -size -100M` - To find all the files which are greater than 50MB and less than 100MB.
* `find . -type f -size +1G -exec du -hs {} \;` - find files bigger then 1G and show theyr actual size for each of them.



