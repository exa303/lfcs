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

<table width="672" cellspacing="0" cellpadding="4" bordercolor="#000000" border="1">
<thead>
<tr>
<th width="167">
<p align="LEFT"><b>Amount of system RAM</b></p>
</th>
<th width="210">
<p align="LEFT"><b>Recommended swap space</b></p>
</th>
<th width="257">
<p align="LEFT"><b>Recommended swap with hibernation</b></p>
</th>
</tr>
</thead>
<tbody>
<tr>
<td width="167">
<p align="LEFT">less than 2 GB</p>
</td>
<td width="210">
<p align="LEFT">2 times the amount of RAM</p>
</td>
<td width="257">
<p align="LEFT">3 times the amount of RAM</p>
</td>
</tr>
<tr>
<td width="167">
<p align="LEFT">2 GB - 8 GB</p>
</td>
<td width="210">
<p align="LEFT">Equal to the amount of RAM</p>
</td>
<td width="257">
<p align="LEFT">2 times the amount of RAM</p>
</td>
</tr>
<tr>
<td width="167">
<p align="LEFT">8 GB - 64 GB</p>
</td>
<td width="210">
<p align="LEFT">0.5 times the amount of RAM</p>
</td>
<td width="257">
<p align="LEFT">1.5 times the amount of RAM</p>
</td>
</tr>
<tr>
<td width="167">
<p align="LEFT">more than 64 GB</p>
</td>
<td width="210">
<p align="LEFT">workload dependent</p>
</td>
<td width="257">
<p align="LEFT">hibernation not recommended</p>
</td>
</tr>
</tbody>
</table>




## References

[redhat](https://www.redhat.com/sysadmin/managing-swap)
[Dave McKay article](https://www.howtogeek.com/449691/what-is-swapiness-on-linux-and-how-to-change-it/amp/)

