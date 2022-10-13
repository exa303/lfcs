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

## Extend space
* `vgextend <volumegroup> <device>`
* `lvextend -L +2G <path to device>` - extend space on logical volume


## Create a filesystem on logical volumes

* `mkfs.ext4 -m 0 /dev/mynew_vg/vol01` - The -m option specifies the percentage reserved for the super-user, we can set this to 0 to use all the available space (the default is 5%).


## Saving space for super-user -m 5

Saving space for important root processes (and possible rescue actions) is one reason.

But there's another. Ext3 is pretty good at avoiding filesystem fragmentation, but once you get above about 95% full, that behavior falls off the cliff, and suddenly filesystem performance becomes a mess. So leaving 5% reserved gives you a buffer against this.

Ext4 should be better at this, as explained by Linux filesystem developer/guru Theodore Ts'o:

    If you set the reserved block count to zero, it won't affect performance much except if you run for long periods of time (with lots of file creates and deletes) while the filesystem is almost full (i.e., say above 95%), at which point you'll be subject to fragmentation problems. Ext4's multi-block allocator is much more fragmentation resistant, because it tries much harder to find contiguous blocks, so even if you don't enable the other ext4 features, you'll see better results simply mounting an ext3 filesystem using ext4 before the filesystem gets completely full.

    If you are just using the filesystem for long-term archive, where files aren't changing very often (i.e., a huge mp3 or video store), it obviously won't matter.




## Errors

if you are creating loop device from a file, you may run in to filtering issue, when trying to create a physical volume. use `wipefs -a /dev/loop<x>` to wipe out symbol table .
