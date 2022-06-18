# Evaluate and compare the basic file system features and options  
* `cat /etc/fstab` 
	* This file is read by mount command on Unix machines. And this process happens at the boot time. Only superusers can mount filesystems.
* `df -T` - shows file system names
* `df -H` - shows in human readable format
* To find the device and filesystem type, you can use any of the following commands:
```bash
   lsblk -l 
   ls -l /dev/disk/by-id/usb*
   dmesg

```

# Main file systems:
## Tmpfs
Tmpfs is a temporary file system for Linux systems. Basically mounted as a disk based system, it resides in the RAM or the volatile memory.
All contents within the tmpfs are temporary. At the time of a reboot or a power outage, all contents are lost.

## Xfs
Additionally, there is another journled file system called the xfs.
It is a very consistent file system In terms of data and improves overall system performance. Xfs is best suited for real-time apps. IT maintains a very good Input/Output bandwidth. It excels at parallel I/O

Today, most of the Red Hat Enterprise Linux are supported by xfs.

## btrfs
Btrf is considered as a copy-on write file system. This file system has unique features since it is written for fault tolerance, easy repair and good administration. Thus btrfs is aimed at implementing advanced features on Linux.

openSUSE is setup using Btrfs alongw with a snapshot for the root partition. Snapshots are elements that let you easily rollback system to a previous point if any update fails or any changes to backup files is needed.

## ext
Was added to Linux kernel in 2008. It is a stopgap technology extending it ancestor ext 3.

Ext 4 is backward compatible as much as possible with ext 3. It allows ext 3 to be upgraded to ext 4. Further, it removes the need to maintain two codebases at the same time.

—–Large file systems: ext 4 was introduced to manage large file system by using 48-bit  internal addressing. Red Hat Enterprise Linux supports ext 4 file systems upto 50 TiB.

Allocating Improvements: it introduces various ways how storage blocks are effectively allocated before they are written to the disk. This way, the read and write performance is improved significantly.

Delayed allocation: Linux commits things into disk and stores them effectively. Thus, with delayed allocation, the ext 4 waits to allocate actual blocks until it’s ready to commit.

---

## MOUNT
* Assuming that the USB drive uses the /dev/sdd1 device you can mount it to /media/usb directory by typing:
	* `sudo mount /dev/sdd1 /media/usb`

## UMOUNT
* umount DIRECTORY
* umount DEVICE_NAME

* If the file system is in use the umount command will fail to detach the file system. In those situations, you can use the fuser command to find out which processes are accessing the file system:
	* `fuser -m DIRECTORY`

* Lazy unmount  -Use the -l (--lazy) option to unmount a busy file system as soon as it is not busy anymore:
	* `umount -l DIRECTORY`
* Force unmount:
	* `umount -f DIRECTORY`



### Ref.
[How to evaluate and compare the basic file system features and options](https://thegcpgurus.com/how-to-evaluate-and-compare-the-basic-file-system-features-and-options/)	
