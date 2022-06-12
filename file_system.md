# Evaluate and compare the basic file system features and options  
* `cat /etc/fstab` 
	* This file is read by mount command on Unix machines. And this process happens at the boot time. Only superusers can mount filesystems.
* `df -T` - shows file system names
* `df -H` - shows in human readable format

# Main file systems:
## Tmpfs
*tmpfs is a temporary file system for Linux systems. Basically mounted as a disk based system, it resides in the RAM or the volatile memory.
All contents within the tmpfs are temporary. At the time of a reboot or a power outage, all contents are lost.

### Ref.
* [How to evaluate and compare the basic file system features and options]("https://thegcpgurus.com/how-to-evaluate-and-compare-the-basic-file-system-features-and-options/")	