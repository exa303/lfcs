# Swap

## Swap partition

The basic steps to take :

  1  Turn off the existing swap space.

  2  Create a new swap partition of the desired size.

  3  Reread the partition table.

  4  Configure the partition as swap space.

  5  Add the new partition/etc/fstab.

  6  Turn on swap.

A reboot should not be necessary.

* Turn off the swap partition with the command which turns off all swap space:
	* `swapoff -a`

* Now display the existing partitions on the hard drive.
	* `fdisk -l`

* Start fdisk in interactive mode with the command:
	* `fdisk /dev/<device name>` - At this point, fdisk is interactive and operates only on the specified disk drive.

* Use the `fdisk p` sub-command to verify that there is enough free space on the disk to create the new swap partition. The space on the hard drive is shown in terms of 512-byte blocks and starting and ending cylinder numbers, so you may have to do some math to determine the available space between and at the end of allocated partitions.

* Use the `n` sub-command to create a new swap partition. fdisk will ask you the starting cylinder. By default, it chooses the lowest-numbered available cylinder. If you wish to change that, type in the number of the starting cylinder.

* The fdisk command now allows you to enter the size of the partitions in a number of formats, including the last cylinder number or the size in bytes, KB or MB. Type in 4000M, which will give about 4GB of space on the new partition (for example), and press Enter.

* Use the `p` sub-command to verify that the partition was created as you specified it. Note that the partition will probably not be exactly what you specified unless you used the ending cylinder number. The fdisk command can only allocate disk space in increments on whole cylinders, so your partition may be a little smaller or larger than you specified. If the partition is not what you want, you can delete it and create it again.

* Now it is necessary to specify that the new partition is to be a swap partition. The sub-command `t` allows you to specify the type of partition. So enter t, specify the partition number, and when it asks for the hex code partition type, `type 82`, which is the Linux swap partition type, and press Enter.

* When you are satisfied with the partition you have created, use the `w` sub-command to write the new partition table to the disk. The fdisk program will exit and return you to the command prompt after it completes writing the revised partition table. **WRITE WHEN YOU ARE SURE**.

* At this point, you use the `partprobe` command to force the kernel to re-read the partition table so that it is not necessary to perform a reboot.

* Now use the command `fdisk -l` to list the partitions and the new swap partition should be among those listed. Be sure that the new partition type is “Linux swap”.

* `mkswap /dev/<new_swap_partition>`

* `swapon -a` - turn swap on.



## Swapfile
* `swapon` - check location size and priority of a swapfile. If nothing shows up swap, it is disabled.
* `swapoff /<location of a swapfile>` -turn off swap space. 

**Create swap file**

* 1 `sudo dd if=/dev/zero of=/swapfile2 bs=1M count=4096 staus=progress`. 
* 2 `sudo chmod 600 /swapfile2`
* 3 `sudo mkswap /swapfile2`
* 4 `sudo swapon /swapfile2`

In order to mount swapfile on boot up you need to edit `/etc/fstab`.
after rebooting system check total swap space with `free -m`.

Swap space recomendations: 

<table width="672" cellspacing="0" cellpadding="4" bordercolor="#000000" border="1">
<thead>
<tr>
<th width="167">
<p align="LEFT"><b>Amount of system RAM</b></p>
</th>
<th width="210">
<p align="LEFT"><b>Recommended swap space</b></p>
</th>
<th width="257">
<p align="LEFT"><b>Recommended swap with hibernation</b></p>
</th>
</tr>
</thead>
<tbody>
<tr>
<td width="167">
<p align="LEFT">less than 2 GB</p>
</td>
<td width="210">
<p align="LEFT">2 times the amount of RAM</p>
</td>
<td width="257">
<p align="LEFT">3 times the amount of RAM</p>
</td>
</tr>
<tr>
<td width="167">
<p align="LEFT">2 GB - 8 GB</p>
</td>
<td width="210">
<p align="LEFT">Equal to the amount of RAM</p>
</td>
<td width="257">
<p align="LEFT">2 times the amount of RAM</p>
</td>
</tr>
<tr>
<td width="167">
<p align="LEFT">8 GB - 64 GB</p>
</td>
<td width="210">
<p align="LEFT">0.5 times the amount of RAM</p>
</td>
<td width="257">
<p align="LEFT">1.5 times the amount of RAM</p>
</td>
</tr>
<tr>
<td width="167">
<p align="LEFT">more than 64 GB</p>
</td>
<td width="210">
<p align="LEFT">workload dependent</p>
</td>
<td width="257">
<p align="LEFT">hibernation not recommended</p>
</td>
</tr>
</tbody>
</table>




## References

[redhat],(https://www.redhat.com/sysadmin/managing-swap)
[Dave McKay article],(https://www.howtogeek.com/449691/what-is-swapiness-on-linux-and-how-to-change-it/amp/)
[Opensource.com](https://opensource.com/article/18/9/swap-space-linux-systems)

