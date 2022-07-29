# PAX 

## Install 

* `sudo apt install pax`
* `sudo pacman -S pax`

## Write (Archive)

* `-w` means write
* `-v` is just verbose
* `-f` allows us to specify the path to our backup file we create. 

`$ pax -wvfz mybackup.pax ~/myfiles`

## Incremental backups

To create an incremental backup, we can use the -T option to instruct pax command to copy only files changed and created since midnight. You can continue to do an incremental backup indefinitely. However, it is recommended to do a full back at least once a week or month, but the frequency will depend on the nature of your work. Note we also add the date to our incremental backup in the command below. 

* `pax -T 0000 -wvf mybackup-$(date +%Y%m%d).pax ~/myfiles`

## Read (Archive)

We can use the `-r` command to read our pax file and extract its contents. We will still keep the `-v` and `-f` options in our command in order to see verbose output and specify the pax file we wish to open. 

* `pax -rvf mybackup.pax ~/myfiles`


