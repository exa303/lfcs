# LVM (Logical volume manager)


* `pvcreate /dev/loop1` - this adds volume to manager, response should be  Physical volume "/dev/sdb1" successfully created.
* `pvcreate /dev/loop2` - this adds volume 2 to manager.
* `pvremove /device`
* `pvdisplay` - will display added volumes to LVM. or pvdisplay /dev/sdb1

* `vgcreate mynew_vg /dev/loop1 /dev/loop2`- this creates volume group `mynew_vg` and adds selected volumes (loop1 and loop2).
* `vgextend mynew_vg /dev/sdb2` - this extends volume group with new device.

## Create logical volumes (cut in to pecies)


Now we can move on to creating logical volumes. It may help to think of our virtual group as a “big cake,” from which we can cut “pieces” (logical volumes) that will get treated as partitions on our Linux system.

* `lvcreate -L 400 -n vol01 mynew_vg` - The following command will create a logical volume named vol01 with a size of 400MB.

* `lvcreate -L 1000 -n vol02 mynew_vg` - Then, we’ll create another volume named vol02 with a size of 1GB. Again, refer to the diagram above to help visualize the configuration. 


## Create a filesystem on logical volumes

* `mkfs.ext4 -m 0 /dev/mynew_vg/vol01` - The -m option specifies the percentage reserved for the super-user, we can set this to 0 to use all the available space (the default is 5%).