# Inodes

Inode is a metadata data structure containing information about actual files.

* `df -i` - check total amount of inodes.
* `stat filename` - will give inode info about that file.
* `ls -i filename` - look at a inode of a specific file.

* Notice procentail difference between inode ammount and space amount when you tipe `df -h , df -i`