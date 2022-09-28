# File Systems


![alt text](/topics1/fs/disk.png)

Sectors - 512 bytes.
Data Block/Cluster - 1-64 Sectors
Default size of a data block usualy 4kB.
1 Data block - boot block, contains information about file system and internal data structure used.
2 Block - inode block, contains metadata about files, including mapping logical adress to physical adress on a disc.
3 Block and other from here are actual data blocks.

Important parameters: 
* Disk size
* Partition size
* File size







## Ext


Ext is for ‘Extended file system’. It was the first system created for Linux. Ext experienced 4 main revisions. It was presented in 1992 and was a massive update from Minix file system. It is far from perfect, so lots of Linux distributions no longer support Ext.


## Ext2


Ext2 does not support journaling. When it was presented, its modernity was that it supported extended file attributes and 2 terabyte drives. Ext2 absence of journal makes it comfortable to use on portable flash drives. However, more universal advanced file systems are available nowadays, like exFAT or FAT32. They are more usable with various OS and are comfortable. So, if you don’t need Ext2, it is better to pay attention to rather modern similar file systems.


## Ext3


Ext3 is similar to Ext2, but it includes journaling. It was created to be backwards connected with Ext2, so partitions between Ext2 and ext3 were able for conversion with no formatting. It is quite an old and usable version, but Ext4 is more common and stable. So, compared to Ext3, Ext4 is better in use.


## Ext4


Max. volume size	?
Max. file size	?
Max. partition size  1EiB


Ext4 and Ext3 were created for compatibility reasons. The one has a built–in Ext4 file system, as Ext3, Ext2, and backwards. It was enhanced and involves fresh updates that reduced file fragmentation, made it possible to have larger files and sizes, and has a `delayed allocation`, which is profitable for flash memory duration. It is a basic or default version of the file system on Linux, nowadays. It had lots of updates and work put in it, so it is widely popular.


* `Delayed allocation` - skips the allocations for extending writes and completes the allocations in a background thread. With this approach, file System performs a smaller number of large allocations instead of performing a large number of small allocations, which reduces the file system's fragmentation.


## BtrFS

Max. volume size	16 EiB
Max. file size	16 EiB
Max. partition size  16EiB


BtrFS usually stands for B–Tree File system, but is pronounced as ‘better’ or ‘butter’ FS. It was created by Oracle. This file system involves `drivepool` - storage pooling, You can create a `subvolume` in your Btrfs filesystem and take `snapshots` of the files/directories in that subvolume. `transparent compression`, and availability for `online defragmentation`. It was originally created to become an alternative to Ext series; also, it has something in common with the ReiserFS former default file system for Linux. BtrFS is often considered the next and better version of Ext4.
By default, Btrfs uses `copy-on-write` `COW` for all files all the time. 
The Btrfs filesystem can be resized online (when the filesystem is mounted), but if you want to resize a partition that is added to a Btrfs filesystem, you will have to do it offline (when the filesystem is not mounted).

Features:

* `transparent compression` - ZSTD, ZLIB, LZO 
* `checksums`
* `online defragmentation`
* `drivepool`
* `automatic snapshot`
* `COW`
* `online grow and shrink (resizing)`
* `Journaling`
* `Raid 1, 5, 6, 10`
* `convert ext 2,3,4 to btrfs with btrfs-convert`
* `64 bits`

[Btrfs](/topics1/fs/btrfs.md)




## ReiserFS

It was presented in 2001 as an alternative for Ext4. It was considered a great progress. It was so innovative that Ext4 was incapable of implementing most of its functions. ReiserFS soon was changed into Reiser4. Reiser4 was the improved version that corrected lots of features and was enhanced in 2004. However, after the incident in 2008 with main developer Hans Reiser, who went to prison, Reiser4 stopped progress. This file system is not included in the main list of Linux, and it is improbable for it to get there soon. BtrFS is a better solution.


## ZFS


Oracle has the ownership for this file system, though initially, it was developed by Sun Microsystems for Solaris. ZFS is advanced, supports `drive pool`, `automatic snapshot`, and` dynamic disk striping`. After BtrFS was introduced, lots of these features became a default set. Every file in ZFS got a `checksum`, which helped to find and determine corrupted or damaged files. Due to the differences in licenses and ownership and legal moments, this file system cannot be included in the main list of Linux file system. However, it is still open-source, though it has Sun license, and it is supported by Linux distributions. Ubuntu, for example, still uses ZFS, especially in its 16/04 version.

- `dynamic disk striping` - what does dinamic exactly mean.


## XFS


XFS was created for Linux in 2001 by Silicon Graphics. It was made for the SGI IRX OS. It doesn’t support mounted snapshots and has `delayed allocation` for enhancing file fragmentation, and with such features, it is similar to Ext4. XFS recommended being effective with large files, but it doesn’t work well with small files, and the performance is worse than in many other file systems. So those who are trying to find something for their `service that works with large files` can consider XFS as an option.


## JFS


JFS stands for ‘journaled file system’. It was originally developed by IBM in 1990, and after that, offered to Linux. It works well with both large and small files and has low CPU. The partitions in this file system can be resized; however, they cannot be shrunk. It was a good option for Linux, back in that day, but they chose the development of Ext series. It is still supported by most of Linux distribution, but initially, it was created for AIX. Ext4 is better to use, as it is more spread, tested, and supported.


## SWAP


Swap is a special option for formatting a drive and creating a backup, but it is not a real file system. It is not structured as a system. It is only a space that keeps your data stored, and the size of data cannot be more than the volume of your RAM. SWAP option is also used during hibernation. In Windows, paging file has a similar mechanism, but it is in the main system partition, while Linux separates an empty partition for it and keeps it for a space to swap the data out.


## FAT32, exFAT, and NTFS


FAT16, FAT32, and exFAT are Microsoft’s FAT file systems supported by Linux and used for formatting a drive. They have no journal, which makes them good for portable memory devices. They are default in every OS, whether it is Windows, macOS, or Linux. These file systems are great if you want to format an external drive using other OS. Nowadays, exFAT is the most appropriate version, as FAT32 is not so powerful. `exFAT works with large files over 4 GB and partitions more than 8 GB`, which is impossible for older (FAT32, FAT16) versions. `NTFS` is a` newer and enhanced version of exFAT`, with strengthened security and object–oriented applications.


There is a wide variety of Linux file systems, but those mentioned here are the most well–known and widely used. Some of the file systems not mentioned here were created for different portable flash devices and other specific needs, so look for a file system to meet your needs.

## Limits

<h3>Certified and [maximum] individual file size</h3>
<table>
<thead>
<tr>
<th>File system</th>
<th>RHEL 3</th>
<th>RHEL 4</th>
<th>RHEL 5</th>
<th>RHEL 6</th>
<th>RHEL 7</th>
<th>RHEL 8</th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>Ext2/3</strong></td>
<td>1TiB (3.0) 2TiB (3.5+)</td>
<td>2TiB</td>
<td>2TiB</td>
<td>2TiB</td>
<td>2TiB</td>
<td>2TiB</td>
</tr>
<tr>
<td><strong>Ext4</strong></td>
<td>n/a</td>
<td>n/a</td>
<td>16TiB (5.6+)<sup>2</sup></td>
<td>16TiB</td>
<td>16TiB</td>
<td>16TiB</td>
</tr>
<tr>
<td><strong>GFS1</strong></td>
<td>2TiB</td>
<td>16TiB [8EiB]</td>
<td>16TiB [8EiB]</td>
<td>n/a</td>
<td>n/a</td>
<td>n/a</td>
</tr>
<tr>
<td><strong>GFS2</strong><sup>1</sup></td>
<td>n/a</td>
<td>n/a</td>
<td>100TiB (5.3+) [8EiB]</td>
<td>100TiB [8EiB]</td>
<td>100TiB [8EiB]</td>
<td>100TiB [8EiB]</td>
</tr>
<tr>
<td><strong>XFS</strong><sup>3</sup></td>
<td>n/a</td>
<td>n/a</td>
<td>100TiB [8EiB]</td>
<td>100TiB [8EiB]</td>
<td>500TiB [8EiB]</td>
<td>8EiB</td>
</tr>
</tbody>
</table>
<h3>Certified and [maximum] file system size</h3>
<table>
<thead>
<tr>
<th>File system</th>
<th>RHEL 3</th>
<th>RHEL 4</th>
<th>RHEL 5</th>
<th>RHEL 6</th>
<th>RHEL 7</th>
<th>RHEL 8</th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>Ext2/3</strong></td>
<td>1TiB (3.0) 2TiB (3.5+) [8TiB]</td>
<td>8TiB</td>
<td>8TiB (5.0), 16TiB (5.1+)<sup>4</sup></td>
<td>16TiB</td>
<td>16TiB</td>
<td>16TiB</td>
</tr>
<tr>
<td><strong>Ext4</strong></td>
<td>n/a</td>
<td>n/a</td>
<td>16TiB [1EiB] (5.6+)<sup>2</sup></td>
<td>16TiB [1EiB]</td>
<td>50TiB [1EiB]</td>
<td>50TiB [1EiB]</td>
</tr>
<tr>
<td><strong>GFS</strong></td>
<td>2TiB</td>
<td>16TiB [8EiB]</td>
<td>16TiB [8EiB]</td>
<td>n/a</td>
<td>n/a</td>
<td>n/a</td>
</tr>
<tr>
<td><strong>GFS2</strong><sup>1</sup></td>
<td>n/a</td>
<td>n/a</td>
<td>100TiB (5.3+) [8EiB]</td>
<td>100TiB [8EiB]</td>
<td>100TiB [8EiB]</td>
<td>100TiB [8EiB]</td>
</tr>
<tr>
<td><strong>XFS</strong><sup>3</sup></td>
<td>n/a</td>
<td>n/a</td>
<td>100TiB [16EiB]</td>
<td>300TiB [16EiB]<sup>5</sup></td>
<td>500TiB [16EiB]</td>
<td>1PiB</td>

## Units

### Units are given in binary prefix:

    TiB = Tebibyte = 240
    PiB = Pebibyte = 250
    EiB = Exbibyte = 260
