# autofs 

One drawback of permanent mounting using the `/etc/fstab` configuration is that, regardless of how infrequently a user accesses the mounted file system, the system must dedicate resources to keep the mounted file system in place. This might affect system performance when, for example, the system is maintaining NFS mounts to many systems at one time. 


## Mounting file systems on demend on a local machine.

* The main autofs configuration file is `/etc/auto.master`. To automatically mount filesystems with autofs, you have to add an entry on the `/etc/auto.master` file.:

```bash
+auto.master

/-	/etc/auto.sdb

```

* Create and type in the following lines in the `/etc/auto.sdb` file.


```bash
/data/fs1       -fstype=auto            :/dev/sdb1
/data/fs2       -fstype=auto            UUID=3a0cc358-dc39-401e-91aa-c24712490257
/data/fs3       -fstype=ext4,noatime    UUID=dccb348c-7f25-4b1e-8f1b-d254aeaec78b
```


* `sudo systemctl restart autofs.service`
* `sudo systemctl status autofs.service`





https://linuxhint.com/mount-filesystems-automatically-on-demand-using-autofs/

https://sort.veritas.com/public/documents/isa/7.3.0.1/linux/productguides/html/access_admin_7301_lin/apbs01.htm **Memory consumption at mount time**