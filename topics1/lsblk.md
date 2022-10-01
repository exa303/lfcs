# lsblk

`lsblk` - displays block devices.


    NAME – Device names
    MAJ:MIN – Major or minor device numbers
    RM – Whether the device is removable (1 if yes, 0 if no)
    SIZE – The size of the device
    RO – Whether the device is read-only
    TYPE – The type of the device
    MOUNTPOINT – Device’s mount point

* `lsblk -f` -  display a list containing file system information including `UUID`.
* `lsblk -p` - paths
* `lsblk -t` - topology 
You can join commands - lsblk -tp
