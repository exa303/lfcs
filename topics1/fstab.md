# fstab

## Configure systems to mount file systems at or during boot - fstab




`blkid` - shows `uuid` and filesystem type. 
`ls -l /dev/disk/by-uuid` - other way to get ids

File system table Table:

```bash
UUID=84516a35-ca53-4dd9-bfa5-760ca3931a95 /               ext4    errors=remount-ro 0       1

```
Table structure:

* `UUID` 
* `Second field – The mountpoint` 
* `Third field – The filesystem type`  
* `Fifth field – Should the filesystem be dumped ?`:


    * `auto` - file system will mount automatically at boot, or when the command 'mount -a' is issued.
    * `noauto` - the filesystem is mounted only when you tell it to.
    * `exec` - allow the execution binaries that are on that partition (default).
    * `noexec` - do not allow binaries to be executed on the filesystem.
    * `ro` - mount the filesystem read only.
    * `rw` - mount the filesystem read-write.
    * `sync` - I/O should be done synchronously. writtes immediatly, small changes.
    * `async` - I/O should be done asynchronously. gather writes bufferes them, oprimises. 
    * `flush` - specific option for FAT to flush data more often, thus making copy dialogs or progress bars to stays up until things are on the disk.
    * `user` - permit any user to mount the filesystem (implies noexec,nosuid,nodev unless overridden).
    * `nouser` - only allow root to mount the filesystem (default).
    * `defaults` - default mount settings (equivalent to rw,suid,dev,exec,auto,nouser,async).
    * `suid` - allow the operation of suid, and sgid bits. They are mostly used to allow users on a computer system to execute binary executables with temporarily elevated privileges in order to perform a specific task.
    * `nosuid` - block the operation of suid, and sgid bits.
    * `noatime` - do not update inode access times on the filesystem. Can help performance.
    * `nodiratime` - do not update directory inode access times on the filesystem. Can help performance. You do not need to enable this flag if you have    already  enabled noatime.
    * `relatime` - update inode access times relative to modify or change time. Access time is only updated if the previous access time was earlier than the current modify or change time (similar to noatime, but doesn't break mutt or other applications that need to know if a file has been read since the last time it was modified). Can help performance. 
        * With the mount option relatime, the access time (atime) will not be written to the disc during every access. The access time (atime) will only change, if one of these two points occurs:

            * the modified time (mtime) or change time status (ctime) of a file is newer than the last access time (atime).
            * the access time (atime) is older than a defined interval (1 day by default on a RHEL system).

            So the relatime mount option is a nice mix between the options atime and noatime and useful for applications, which need the access time (atime) of a file. With the relatime option, there will not be as much traffic on the disk, if a file is often accessed. For example on a webserver is the mount option relatime a good solution, because here are many read actions, but the atime will only updated once a day (with the 24 hours interval setting).

            If you use a solid-state disk (SSD) and have no application which needs the access time, you should use the mount option noatime.

multiple mount points supported: `auto,exec,ro` .


 
* `Sixth field – Fsck order` - The sixth field is used to establish the order by which another utility, fsck, should check filesystems on boot. The value of 1 must always be used for the root filesystem; for all the others we can use 2. If this value is not provided it defaults to 0, and the filesystem will not be checked. 

* `/etc/mtab` - is reprisentative state of all mounted files

