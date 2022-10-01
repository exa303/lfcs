# fdisk 
## Paritions

* `fdisk -`l - list 
* `fdisk <path> - select partition,  disk you are working with

1. `n` - create partition
2. `p | e` - select extended partition or primary
3. `1-4` - select partition number
4. `First sector` - press anter to select first available sector
5. `Last sector` - wirte in how much space you want your partition to take:
    +10M - 10 megabytes
    +10G - 10 gigabytes

**If you don’t specify a unit, the unit will be assumed to be sectors. Hence +1024 will mean 1024 sectors from the starting sector.**

6. Once we create a partition, Linux sets the default partition type as ‘Linux’. However, suppose we wish my partition type to be the ‘Linux LVM’ partition. To change the ID for our partition, we will use the command `‘t’`.

7. Now, we get prompted to enter the HEX code for our desired partition ID. We don’t remember the HEX code for the partition types on top of our heads. So we will take the help of the `‘L’` command to list all the HEX codes for the available partition types. This list should look as shown below.