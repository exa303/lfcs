# Swap


## Swapfile

* `swapon` - check location size and priority of a swapfile. If nothing showsup swap is disabled.
* `swapoff /<location of a swapfile>` -turn off swap space. 

**Create swap file**

* 1 `sudo dd if=/dev/zero of=/swapfile2 bs=1M count=4096 staus=progress`. 
* 2 `sudo chmod 600 /swapfile2`
* 3 `sudo mkswap /swapfile2`
* 4 `sudo swapon /swapfile2`

In order to mount swapfile on boot up you need to edit `/etc/fstab`.
after rebooting system check total swapspace with `free -m`.

Swap space recomendations: 

<table>


  <tr>
    <th>Amount of system RAM/th>
    <th>as</th>
    <th>as</th>
    <th>as</th>
    <th></th>
  </tr>

<tr>
	<td>1</td>
</tr>


<table>




## References

[redhat](https://www.redhat.com/sysadmin/managing-swap)
[Dave McKay article](https://www.howtogeek.com/449691/what-is-swapiness-on-linux-and-how-to-change-it/amp/)

