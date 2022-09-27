# Linux commands to Archive, Backup, Compress, Unpack and Uncompressing files.

### Tar

What is “tar” in Linux?

Tar is commonly used to backup or compress files. It is also used to transfer files and folders. The task of compression and performing archive can also be achieved using tar command. Tar comes in with a few flags as mentioned below:

`-c flag` = It is used to Create a new archive in Linux environment

`-f flag` = It is used to archive file in Linux

`-x flag` = It is used to extract files from within an archive in Linux

`-C flag` = This flag is used to Uncompress or extract files to a defined directory in Linux.

`-v flag` = It is used to list files processed verbosely in Linux

`-j flag` = This is used to Filter the archive via bzip2 in Linux systems.

`-z flag` = This is a flag that is used to filter the archive through gzip in linux

### Commands

* `less tarfile.tar` - Check the contents of tarfile.

* `tar -cvf <archive_name.tar> <file_name_which_you_wish_to_compress_or_a_dir>`  - tar file.
* `tar -xvf <archive_name.tar>` - untar file.
* `tar -xvf <archive_name.tar> -C /some/location` - untar file to a specific location.
* `tar -xvf mybackup.tar.gz   /destination/to/that/file/mybackup.xml` - untar single file  from tar.gz File.
* `tar -xvf file.tar etc` - untar single directory form file

### Using the gzip method

* `tar -zcvf archive.tar.gz /folder_to_archive` - `-z` flag is used to let tar know that the folder to be compressed is done using gzip.
* `tar -zxvf archive.tar.gz` - untar gzip. 

### Using wild cards

* `tar -xvf Phpfiles1-org.tar –wildcards ‘*.php’ ` - To uncompress multiple files simultaneously, Linux provides a mechanism for that.

* `cvf - cukraus vata fainai` .



