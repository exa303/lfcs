# autofs service

 An alternative to /etc/fstab is to use the kernel-based autofs service. It consists of the following components:

    A kernel module that implements a file system, and
    A user-space service that performs all of the other functions. 

The autofs service can mount and unmount file systems automatically (on-demand), therefore saving system resources. It can be used to mount file systems such as NFS, AFS, SMBFS, CIFS, and local file systems. 

autofs config file:

* `/etc/auto.master` - master configuration file for autofs
	* tree fields: directory to mount(mount-point), mount map file, parameters 
	`/mnt 	/etc/test.share 	--timeout=30`  - after 30 seconds if files have not been uset autofs will umount it automaticaly.

map file:

* `/etc/test.share` - map file:
	`/Softwares -fstype=auto server:/Softwares` - <mount end point>, <file system type>, <SOURCE>



https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/managing_file_systems/assembly_mounting-file-systems-on-demand_managing-file-systems