# arp

* `sudo arp -s 10.0.0.2 00:0c:29:c0:94:bf` - set new 

* `arp -a -n `- all numeric

* `sudo arp -d 10.0.0.2` - delete entry

Note that any ARP entry added by arp command at run time like above does not remain persistently across reboots. In order to add a static ARP entry permanently, what you can do is to load ARP entries from an external file automatically when a network interface is up. For that, first create a file that contains static ARP entries.

* `sudo vi /etc/ethers`

```bash

00:0c:29:c0:94:bf 10.0.0.2
00:0c:59:44:f0:a0 10.0.0.5
. . . .
```