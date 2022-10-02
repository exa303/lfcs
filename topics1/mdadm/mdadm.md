## Create loop devices from files manualy mounting

* `fallocate -l 1G disk1` - alternative to dd. allocates memory. Thats basicaly all you need to know.

* `losetup -f <file path>` - out of this file we will create a loop device and attach it. 
* `losetup -d <loop device>` - detach loop device. 
    * In case we want to detach all existing loop devices, instead, we can use the `-D`. 

## Create loop devices from files 2 auto mount

* `fallocate -l 1G disk1` - alternative to dd. allocates memory. Thats basicaly all you need to know.

* add an entry to fstab. It will create a loop device and add it to `/dev/loop[x]` - `[x]` stand for number kernel will attach.
```bash
/home/avx/Desktop/raid/disk2    /home/avx/Desktop/raid/mnt2     ext4    loop    0       0
```
after this you can remount table `sudo mount -a`.




# mdadm

Mounted raid devices reside in `/dev/md0`
* `cat /proc/mdstat` - check status of mdadm.
* `sudo mkfs.ext4 /dev/md0` - format RAID array in specific fs.

* `sudo umount /dev/md0` - mounting/unmounting

* Create (mdadm --create) is used to create a new array:
    * `mdadm --create --verbose /dev/md0 --level=1 --raid-devices /dev/sda1 /dev/sdb2`

* `/etc/mdadm.conf` - configuration.

## Remove a disk from an array

We can’t remove a disk directly from the array, unless it is failed, so we first have to fail it (if the drive it is failed this is normally already in failed state and this step is not needed):

* `mdadm --fail /dev/md0 /dev/sda1`
* `mdadm --remove /dev/md0 /dev/sda1`

## Add a disk to an existing array(it will be added as a spare)

* `mdadm --add /dev/md0 /dev/sdb1`

## Verifying the status of the RAID arrays

* `mdadm --detail /dev/md0` - gives the current status of a raid system on `/dev/md0`

## Monitoring

* `watch cat /proc/mdstat` - gives state of drives in real time
* `sudo mdadm --monitor --oneshot --test --mail exa303@gmail.com /dev/md0` - send notifications

##  Stop and delete a RAID array

* `mdadm --stop /dev/md0` - If we want to completely remove a raid array we have to stop if first and then remove it
* `mdadm --remove /dev/md0` 
* `mdadm --zero-superblock /dev/sda` - delete the superblock from the individual drives.

* `sfdisk -d /dev/sda | sfdisk /dev/sdb` -this will dump the partition table of sda, removing completely the existing partitions on sdb, so be sure you want this before running this command, as it will not warn you at all.

## Start again 

* `mdadm --assemble /dev/md0` - /dev/md0 has to be defined in a mdadm.conf file.

## Save configuration

* `mdadm --detail --scan >> /etc/mdadm/mdadm.conf` - or just append output of a scan command to a file.










https://unix.stackexchange.com/questions/595547/creating-raid-arrays-on-files-instead-of-block-devices

https://unix.stackexchange.com/questions/474754/build-raid-5-with-mdadm-and-1-disk-with-data/474877#474877

https://unix.stackexchange.com/questions/545404/what-should-i-expect-to-see-if-md-linux-raid-is-properly-compensating-for-a-fail/545618#545618

https://landoflinux.com/linux_fallocate_command.html