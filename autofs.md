# autofs service

 An alternative to /etc/fstab is to use the kernel-based autofs service. It consists of the following components:

    A kernel module that implements a file system, and
    A user-space service that performs all of the other functions. 

The autofs service can mount and unmount file systems automatically (on-demand), therefore saving system resources. It can be used to mount file systems such as NFS, AFS, SMBFS, CIFS, and local file systems. 


* `vim /etc/auto.master` - master configuration file for autofs
	* tree fields: direktory to mount, mount map file, parameters 
	`/mnt 	/etc/test.share 	--timeout=30`



https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/managing_file_systems/assembly_mounting-file-systems-on-demand_managing-file-systems