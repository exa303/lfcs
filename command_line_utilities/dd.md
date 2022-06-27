# dd 
* usage: `dd option=value option=value option=value`
**args:**
* `bs` - block size . Default (512 bytes). `dd if=file1 of=file2 bs=1M` will move in 1 Megabyte chunks.
* `count` - determines number of blocks that will be moved`dd if=file1 of=file2 bs=1M count=2`
* `skip` - how many blocks(default 512) to skip from begining of the INPUT file `dd if=file1 of=file2 bs=1 skip=3`
* `seek` - how many bytes to skip in OUTPUT file before start writing
* `status=progress` - just to show verbose output


```
#if = "input file"
#of = "output file"

dd if="value" of="value"

```

* `dd if=/dev/sdb of=/dev/sdb5` - woud copy all the bits from input file to the output file
* `dd if=/dev/sdb of=copy.img` - would save all the bits to a file

* `dd if=/dev/zero` `dd if=/dev/random`- can be used to wipe things out (or in case of random write random bytes), or image with empty bytes written.

