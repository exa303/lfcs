# Create and configure encrypted storage

The device mapper is a framework provided by the Linux kernel for mapping physical block devices onto higher-level virtual block devices. It forms the foundation of the logical volume manager (LVM), software RAIDs and dm-crypt disk encryption, and offers additional features such as file system snapshots.

## Testing for Encryption Support
Before we proceed further, we need to make sure that our kernel has been compiled with encryption support:
	* `grep -i config_dm_crypt /boot/config-$(uname -r)`
	`CONFIG_DM_CRYPT=m` <- this means that dm crypt whas compiled as a loadable module.
	`lsmod | grep dm_crypt` <- if this returns that there is no module in the system, you need to load it with `modeprobe dm_crypt`.


**Installing Cryptsetup**

Cryptsetup is a frontend interface for creating, configuring, accessing, and managing encrypted file systems using dm-crypt.

* `apt-get install cryptsetup`

The default operating mode for cryptsetup is LUKS (Linux Unified Key Setup) so we’ll stick with it. We will begin by setting the LUKS partition and the passphrase:

* `cryptsetup -y luksFormat /dev/sdb1`

Should you want to change the cipher, hash, or key parameters, you can use the –cipher, –hash, and –key-size flags, respectively, with the values taken from /proc/crypto.

Next, we need to open the LUKS partition (we will be prompted for the passphrase that we entered earlier). If the authentication succeeds, our encrypted partition will be available inside `/dev/mapper` with the specified name:

* `cryptsetup luksOpen /dev/sdb1 my_encrypted_partition`

format out partition as ext4:

* `mkfs.ext4 /dev/mapper/my_encrypted_partition`

and create a mount point to mount the encrypted partition. Finally, we may want to confirm whether the mount operation succeeded.

```
mkdir /mnt/enc
mount /dev/mapper/my_encrypted_partition /mnt/enc
mount | grep partition
```
When you are done writing to or reading from your encrypted file system, simply unmount it

`umount /mnt/enc`

and close the LUKS partition using,

`cryptesetup luksClose my_encrypted_partition`

Testing Encryption

Finally, we will check whether our encrypted partition is safe:

1. Open the LUKS partition

`cryptsetup luksOpen /dev/sdb1 my_encrypted_partition`

2. Enter your passphrase

3. Mount the partition

`mount /dev/mapper/my_encrypted_partition /mnt/enc`

4. Create a dummy file inside the mount point.

`echo “This is Part 3 of a 12-article series about the LFCE certification” > /mnt/enc/testfile.txt`

5. Verify that you can access the file that you just created.

`cat /mnt/enc/testfile.txt`

6. Unmount the file system.

`umount /mnt/enc`

7. Close the LUKS partition.

`cryptsetup luksClose my_encrypted_partition`

8. Try to mount the partition as a regular file system. It should indicate an error.

`mount /dev/sdb1 /mnt/enc`

Test Encryption on Partition
Test Encryption on Partition
Encryptin the Swap Space for Further Security

The passphrase you entered earlier to use the encrypted partition is stored in RAM memory while it’s open. If someone can get his hands on this key, he will be able to decrypt the data. This is especially easy to do in the case of a laptop, since while hibernating the contents of RAM are kept on the swap partition.

To avoid leaving a copy of your key accessible to a thief, encrypt the swap partition following these steps:

1 Create a partition to be used as swap with the appropriate size (/dev/sdd1 in our case) and encrypt it as explained earlier. Name it just “swap” for convenience.’

2.Set it as swap and activate it.

`mkswap /dev/mapper/swap`
`swapon /dev/mapper/swap`

3. Next, change the corresponding entry in /etc/fstab.

`/dev/mapper/swap none        	swap	sw          	0   	0`

4. Finally, edit /etc/crypttab and reboot.

`swap               /dev/sdd1         /dev/urandom sw`ap

Once the system has finished booting, you can verify the status of the swap space:

`cryptsetup status swap`

