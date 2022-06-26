http://souptonuts.sourceforge.net/quota_tutorial.html
https://askubuntu.com/questions/33328/how-can-i-limit-disk-space-usage-for-one-user

# Quota

First you need to install `quota` and `quotatool`. 




---


### Alternative

To restrict hard disk usage per user efficiently we could create a separate partition for each of the `/home` directories. However then it's obviously not so easy to change the granted space or add new users.

We therefore may use fixed sized images as a container for the users `/home` and mount these as loop devices (as root):

*1 `mkdir /media/users/`
*2 `dd if=/dev/zero of=/media/users/john123.img bs=512K count=200`
*3 `mkfs.ext4 /media/users/john123.img`
*4 `mkdir /home/john123`

For testing:

*5 `mount -o loop /media/users/john123.img /home/john123`

After having done so we then create our user `john123` who will now have 100 MB space available in his `/home/john123`.

Subsequently the loop devices will have to be mounted prior to login, e.g. by adding this to `/etc/fstab`:

*6 /media/users/john123.img    /home/john123    ext4    loop    0    2


## fstab

Your Linux system's filesystem table, aka fstab, is a configuration table designed to ease the burden of mounting and unmounting file systems to a machine. It is a set of rules used to control how different filesystems are treated each time they are introduced to a system.