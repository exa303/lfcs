


# Quota

First you need to install `quota` and `quotatool`. 


Sources:


* [askubunut](https://askubuntu.com/questions/33328/how-can-i-limit-disk-space-usage-for-one-user)
* [sourceforge](http://souptonuts.sourceforge.net/quota_tutorial.html)

---


### Alternative

To restrict hard disk usage per user efficiently we could create a separate partition for each of the `/home` directories. However then it's obviously not so easy to change the granted space or add new users.

We therefore may use fixed sized images as a container for the users `/home` and mount these as loop devices (as root):

* 1 `mkdir /media/users/`
* 2 `dd if=/dev/zero of=/media/users/john123.img bs=512K count=200`
* 3 `mkfs.ext4 /media/users/john123.img`
* 4 `mkdir /home/john123`

For testing:

* 5 `mount -o loop /media/users/john123.img /home/john123`

After having done so we then create our user `john123` who will now have 100 MB space available in his `/home/john123`.

Subsequently the loop devices will have to be mounted prior to login, e.g. by adding this to `/etc/fstab`:

* 6 `/media/users/john123.img    /home/john123    ext4    loop    0    2`


## fstab

Your Linux system's filesystem table, aka fstab, is a configuration table designed to ease the burden of mounting and unmounting file systems to a machine. It is a set of rules used to control how different filesystems are treated each time they are introduced to a system.

Table structure

The table itself is a 6 column structure, where each column designates a specific parameter and must be set up in the correct order. The columns of the table are as follows from left to right: 

* **Device:** usually the given name or UUID of the mounted device (sda1/sda2/etc).
* **Mount Point:** designates the directory where the device is/will be mounted. 
* **File System Type:** shows the type of filesystem in use. 
* **Options:** lists any active mount options. If using multiple options they must be separated by commas. 
* **Backup Operation:** (the first digit) this is a binary system where 1 = dump utility backup of a partition. 0 = no backup. This is an outdated backup method and should NOT be used. 
* **File System Check Order:** (second digit) Here we can see three possible outcomes.  0 means that fsck will not check the filesystem. Numbers higher than this represent the check order. The root filesystem should be set to 1 and other partitions set to 2. 

`sudo mount -o remount -a` - will remount all fs widouth restart `-o` for option `-a` for all.



## Advanced usage

There are other options for more advanced users that I do not have configured here (therefore, there are no examples shown). However, there are some great resources on the web to explain these options. The ones that I would check out are as follows:

* auto/noauto: controls whether the partition is mounted automatically on boot (or not).
* exec/noexec: controls whether or not the partition can execute binaries. In the name of security, this is usually set to noexec.
* ro/rw: controls read and write privileges - ro = read-only, where rw= read-write.
* nouser/user: controls whether or not the user has mounting privileges. This defaults to noexec for all user accounts.
