# Create and manage RAID devices
* [RAID Concepts](/RAID/raid_concepts.md) **Source: www.techmint.com**
* [RAID Levels](/RAID/raid_levels.md) **Source: www.thegeekstuff.com**



Our tool of choice for creating, assembling, managing, and monitoring our software RAIDs is called <b>mdadm</b> (short for multiple disks admin).</p>
<pre>---------------- Debian and Derivatives ----------------
# aptitude update &amp;&amp; aptitude install mdadm 
</pre>
<pre>---------------- Red Hat and CentOS based Systems ----------------
# yum update &amp;&amp; yum install mdadm
</pre>
<pre>---------------- On openSUSE ----------------
# zypper refresh &amp;&amp; zypper install mdadm # 
</pre>
<h4>Assembling Partitions as RAID Devices</h4>
<p>The process of assembling existing partitions as RAID devices consists of the following steps.</p>
<h6>1. Create the array using mdadm</h6>
<p>If one of the partitions has been formatted previously, or has been a part of another RAID array previously, you will be prompted to confirm the creation of the new array. Assuming you have taken the necessary precautions to avoid losing important data that may have resided in them, you can safely type <b>y</b> and press <b>Enter</b>.</p>
<pre># mdadm --create --verbose /dev/md0 --level=stripe --raid-devices=2 /dev/sdb1 /dev/sdc1
</pre>
<figure id="attachment_9420" aria-describedby="caption-attachment-9420" style="width: 610px" class="wp-caption aligncenter"><a href="https://www.tecmint.com/wp-content/uploads/2014/10/Creating-RAID-Array.png"><img src="https://www.tecmint.com/wp-content/uploads/2014/10/Creating-RAID-Array-620x113.png" loading="lazy" class="size-medium wp-image-9420" alt="Creating RAID Array" srcset="https://www.tecmint.com/wp-content/uploads/2014/10/Creating-RAID-Array-620x113.png 620w, https://www.tecmint.com/wp-content/uploads/2014/10/Creating-RAID-Array.png 795w" sizes="(max-width: 620px) 100vw, 620px" style="" data-lazy-loaded="true" width="620" height="113"><noscript>&lt;img loading="lazy" class="size-medium wp-image-9420" src="https://www.tecmint.com/wp-content/uploads/2014/10/Creating-RAID-Array-620x113.png" alt="Creating RAID Array" width="620" height="113" srcset="https://www.tecmint.com/wp-content/uploads/2014/10/Creating-RAID-Array-620x113.png 620w, https://www.tecmint.com/wp-content/uploads/2014/10/Creating-RAID-Array.png 795w" sizes="(max-width: 620px) 100vw, 620px" /&gt;</noscript></a><figcaption id="caption-attachment-9420" class="wp-caption-text">Creating RAID Array</figcaption></figure>
<h6>2. Check the array creation status</h6>
<p>In order to check the array creation status, you will use the following commands – regardless of the RAID type. These are just as valid as when we are creating a RAID0 (as shown above), or when you are in the process of setting up a RAID5, as shown in the image below.</p>
<pre># cat /proc/mdstat
or 
# mdadm --detail /dev/md0	[More detailed summary]
</pre>
<figure id="attachment_9421" aria-describedby="caption-attachment-9421" style="width: 421px" class="wp-caption aligncenter"><a href="https://www.tecmint.com/wp-content/uploads/2014/10/Check-RAID-Array-Status.png"><img src="https://www.tecmint.com/wp-content/uploads/2014/10/Check-RAID-Array-Status-431x450.png" loading="lazy" class="size-medium wp-image-9421" alt="Check RAID Array Status" srcset="https://www.tecmint.com/wp-content/uploads/2014/10/Check-RAID-Array-Status-431x450.png 431w, https://www.tecmint.com/wp-content/uploads/2014/10/Check-RAID-Array-Status.png 623w" sizes="(max-width: 431px) 100vw, 431px" style="" data-lazy-loaded="true" width="431" height="450"><noscript>&lt;img loading="lazy" class="size-medium wp-image-9421" src="https://www.tecmint.com/wp-content/uploads/2014/10/Check-RAID-Array-Status-431x450.png" alt="Check RAID Array Status" width="431" height="450" srcset="https://www.tecmint.com/wp-content/uploads/2014/10/Check-RAID-Array-Status-431x450.png 431w, https://www.tecmint.com/wp-content/uploads/2014/10/Check-RAID-Array-Status.png 623w" sizes="(max-width: 431px) 100vw, 431px" /&gt;</noscript></a><figcaption id="caption-attachment-9421" class="wp-caption-text">Check RAID Array Status</figcaption></figure>
<h6>3. Format the RAID Device</h6>
<p>Format the device with a filesystem as per your needs / requirements, as explained in <a href="https://www.tecmint.com/create-partitions-and-filesystems-in-linux/" target="_blank">Part 4</a> of this series.</p>
<h6>4. Monitor RAID Array Service</h6>
<p>Instruct the monitoring service to “keep an eye” on the array. Add the output of <b>mdadm –detail –scan</b> to <b>/etc/mdadm/mdadm.conf</b> (Debian and derivatives) or <b>/etc/mdadm.conf</b> (CentOS / openSUSE), like so.</p>
<pre># mdadm --detail --scan
</pre>
<figure id="attachment_9422" aria-describedby="caption-attachment-9422" style="width: 610px" class="wp-caption aligncenter"><a href="https://www.tecmint.com/wp-content/uploads/2014/10/Monitor-RAID-Array.png"><img src="https://www.tecmint.com/wp-content/uploads/2014/10/Monitor-RAID-Array-620x140.png" loading="lazy" class="size-medium wp-image-9422" alt="Monitor RAID Array" srcset="https://www.tecmint.com/wp-content/uploads/2014/10/Monitor-RAID-Array-620x140.png 620w, https://www.tecmint.com/wp-content/uploads/2014/10/Monitor-RAID-Array.png 722w" sizes="(max-width: 620px) 100vw, 620px" style="" data-lazy-loaded="true" width="620" height="140"><noscript>&lt;img loading="lazy" class="size-medium wp-image-9422" src="https://www.tecmint.com/wp-content/uploads/2014/10/Monitor-RAID-Array-620x140.png" alt="Monitor RAID Array" width="620" height="140" srcset="https://www.tecmint.com/wp-content/uploads/2014/10/Monitor-RAID-Array-620x140.png 620w, https://www.tecmint.com/wp-content/uploads/2014/10/Monitor-RAID-Array.png 722w" sizes="(max-width: 620px) 100vw, 620px" /&gt;</noscript></a><figcaption id="caption-attachment-9422" class="wp-caption-text">Monitor RAID Array</figcaption></figure>
<pre># mdadm --assemble --scan 	[Assemble the array]
</pre>
<p>To ensure the service starts on system boot, run the following commands as root.</p>
<h6>Debian and Derivatives</h6>
<p>Debian and derivatives, though it should start running on boot by default.</p>
<pre># update-rc.d mdadm defaults
</pre>
<p>Edit the <b>/etc/default/mdadm</b> file and add the following line.</p>
<pre>AUTOSTART=true
</pre>
<h6>On CentOS and openSUSE (systemd-based)</h6>
<pre># systemctl start mdmonitor
# systemctl enable mdmonitor
</pre>
<h6>On CentOS and openSUSE (SysVinit-based)</h6>
<pre># service mdmonitor start
# chkconfig mdmonitor on
</pre>
<h6>5. Check RAID Disk Failure</h6>
<p>In RAID levels that support redundancy, replace failed drives when needed. When a device in the disk array becomes faulty, a rebuild automatically starts only if there was a spare device added when we first created the array.</p>
<figure id="attachment_9423" aria-describedby="caption-attachment-9423" style="width: 548px" class="wp-caption aligncenter"><a href="https://www.tecmint.com/wp-content/uploads/2014/10/Check-RAID-Faulty-Disk.png"><img src="https://www.tecmint.com/wp-content/uploads/2014/10/Check-RAID-Faulty-Disk.png" loading="lazy" class="size-full wp-image-9423" alt="Check RAID Faulty Disk" style="" data-lazy-loaded="true" width="558" height="407"><noscript>&lt;img loading="lazy" class="size-full wp-image-9423" src="https://www.tecmint.com/wp-content/uploads/2014/10/Check-RAID-Faulty-Disk.png" alt="Check RAID Faulty Disk" width="558" height="407" /&gt;</noscript></a><figcaption id="caption-attachment-9423" class="wp-caption-text">Check RAID Faulty Disk</figcaption></figure>
<p>Otherwise, we need to manually attach an extra physical drive to our system and run.</p>
<pre># mdadm /dev/md0 --add /dev/sdX1
</pre>
<p>Where <b>/dev/md0</b> is the array that experienced the issue and <b>/dev/sdX1</b> is the new device.</p>
<h6>6. Disassemble a working array</h6>
<p>You may have to do this if you need to create a new array using the devices – (<b>Optional Step</b>).</p>
<pre># mdadm --stop /dev/md0 				#  Stop the array
# mdadm --remove /dev/md0 			# Remove the RAID device
# mdadm --zero-superblock /dev/sdX1 	# Overwrite the existing md superblock with zeroes
</pre>
<h6>7. Set up mail alerts</h6>
<p>You can configure a valid email address or system account to send alerts to (make sure you have this line in <b>mdadm.conf</b>). – (<b>Optional Step</b>)</p>
<pre>MAILADDR root
</pre>
<p>In this case, all alerts that the RAID monitoring daemon collects will be sent to the local root account’s mail box. One of such alerts looks like the following.</p>
<p><strong style="color: red;">Note</strong>: This event is related to the example in <b>STEP 5</b>, where a device was marked as faulty and the spare device was automatically built into the array by mdadm. Thus, we “<b>ran out</b>” of healthy spare devices and we got the alert.</p>
<figure id="attachment_9424" aria-describedby="caption-attachment-9424" style="width: 568px" class="wp-caption aligncenter"><a href="https://www.tecmint.com/wp-content/uploads/2014/10/RAID-Monitoring-Alerts.png"><img src="https://www.tecmint.com/wp-content/uploads/2014/10/RAID-Monitoring-Alerts.png" loading="lazy" class="size-full wp-image-9424" alt="RAID Monitoring Alerts" style="" data-lazy-loaded="true" width="578" height="366"><noscript>&lt;img loading="lazy" class="size-full wp-image-9424" src="https://www.tecmint.com/wp-content/uploads/2014/10/RAID-Monitoring-Alerts.png" alt="RAID Monitoring Alerts" width="578" height="366" /&gt;</noscript></a><figcaption id="caption-attachment-9424" class="wp-caption-text">RAID Monitoring Alerts</figcaption></figure>
<h4>Understanding RAID Levels</h4>
<h5>RAID 0</h5>
<p>The total array size is <b>n</b> times the size of the smallest partition, where <b>n</b> is the number of independent disks in the array (you will need at least two drives). Run the following command to assemble a <b>RAID 0</b> array using partitions <b>/dev/sdb1</b> and <b>/dev/sdc1</b>.</p>
<pre># mdadm --create --verbose /dev/md0 --level=stripe --raid-devices=2 /dev/sdb1 /dev/sdc1
</pre>
<p><b>Common uses</b>: Setups that support real-time applications where performance is more important than fault-tolerance.</p>
<h5>RAID 1 (aka Mirroring)</h5>
<p>The total array size equals the size of the smallest partition (you will need at least two drives). Run the following command to assemble a <b>RAID 1</b> array using partitions <b>/dev/sdb1</b> and <b>/dev/sdc1</b>.</p>
<pre># mdadm --create --verbose /dev/md0 --level=1 --raid-devices=2 /dev/sdb1 /dev/sdc1
</pre>
<p><b>Common uses</b>: Installation of the operating system or important subdirectories, such as <b>/home</b>.</p>
<h5>RAID 5 (aka drives with Parity)</h5>
<p>The total array size will be (<b>n – 1</b>) times the size of the smallest partition. The “<b>lost</b>” space in (<b>n-1</b>) is used for parity (redundancy) calculation (you will need at least three drives).</p>
<p>Note that you can specify a spare device (<b>/dev/sde1</b> in this case) to replace a faulty part when an issue occurs. Run the following command to assemble a <b>RAID 5</b> array using partitions <b>/dev/sdb1</b>, <b>/dev/sdc1</b>, <b>/dev/sdd1</b>, and <b>/dev/sde1</b> as spare.</p>
<pre># mdadm --create --verbose /dev/md0 --level=5 --raid-devices=3 /dev/sdb1 /dev/sdc1 /dev/sdd1 --spare-devices=1 /dev/sde1
</pre>
<p><b>Common uses</b>: Web and file servers.</p>
<h5>RAID 6 (aka drives with double Parity</h5>
<p>The total array size will be (<b>n*s)-2*s</b>, where <b>n</b> is the number of independent disks in the array and <b>s</b> is the size of the smallest disk. Note that you can specify a spare device (<b>/dev/sdf1</b> in this case) to replace a faulty part when an issue occurs.</p>
<p>Run the following command to assemble a <b>RAID 6</b> array using partitions <b>/dev/sdb1</b>, <b>/dev/sdc1</b>, <b>/dev/sdd1</b>, <b>/dev/sde1</b>, and <b>/dev/sdf1</b> as spare.</p>
<pre># mdadm --create --verbose /dev/md0 --level=6 --raid-devices=4 /dev/sdb1 /dev/sdc1 /dev/sdd1 /dev/sde --spare-devices=1 /dev/sdf1
</pre>
<p><b>Common uses</b>: File and backup servers with large capacity and high availability requirements.</p>
<h5>RAID 1+0 (aka stripe of mirrors)</h5>
<p>The total array size is computed based on the formulas for <b>RAID 0</b> and <b>RAID 1</b>, since <b>RAID 1+0</b> is a combination of both. First, calculate the size of each mirror and then the size of the stripe.</p>
<p>Note that you can specify a spare device (<b>/dev/sdf1</b> in this case) to replace a faulty part when an issue occurs. Run the following command to assemble a <b>RAID 1+0</b> array using partitions <b>/dev/sdb1</b>, <b>/dev/sdc1</b>, <b>/dev/sdd1</b>, <b>/dev/sde1</b>, and <b>/dev/sdf1</b> as spare.</p>
<pre># mdadm --create --verbose /dev/md0 --level=10 --raid-devices=4 /dev/sd[b-e]1 --spare-devices=1 /dev/sdf1</pre>
<p><b>Common uses</b>: Database and application servers that require fast I/O operations.</p>
<h4>Creating and Managing System Backups</h4>
<p>It never hurts to remember that RAID with all its bounties <b>IS NOT A REPLACEMENT FOR BACKUPS!</b> Write it 1000 times on the chalkboard if you need to, but make sure you keep that idea in mind at all times. Before we begin, we must note that there is no <b>one-size-fits-all</b> solution for system backups, but here are some things that you do need to take into account while planning a backup strategy.</p>
<ol>
<li>What do you use your system for? (Desktop or server? If the latter case applies, what are the most critical services – whose configuration would be a real pain to lose?)</li>
<li>How often do you need to take backups of your system?</li>
<li>What is the data (e.g. files / directories / database dumps) that you want to backup? You may also want to consider if you really need to backup huge files (such as audio or video files).</li>
<li>Where (meaning physical place and media) will those backups be stored?</li>
</ol>
<h5>Backing Up Your Data</h5>
<p><b>Method 1</b>: Backup entire drives with <b>dd</b> command. You can either back up an entire hard disk or a partition by creating an exact image at any point in time. Note that this works best when the device is offline, meaning it’s not mounted and there are no processes accessing it for I/O operations.</p>
<p>The downside of this backup approach is that the image will have the same size as the disk or partition, even when the actual data occupies a small percentage of it. For example, if you want to image a partition of <b>20</b> GB that is only <b>10%</b> full, the image file will still be <b>20 GB</b> in size. In other words, it’s not only the actual data that gets backed up, but the entire partition itself. You may consider using this method if you need exact backups of your devices.</p>
<h6>Creating an image file out of an existing device</h6>
<pre># dd if=/dev/sda of=/system_images/sda.img
OR
--------------------- Alternatively, you can compress the image file --------------------- 
# dd if=/dev/sda | gzip -c &gt; /system_images/sda.img.gz 
</pre>
<h6>Restoring the backup from the image file</h6>
<pre># dd if=/system_images/sda.img of=/dev/sda
OR 

--------------------- Depending on your choice while creating the image  --------------------- 
gzip -dc /system_images/sda.img.gz | dd of=/dev/sda 
</pre>
<p><b>Method 2</b>: Backup certain files <b>/</b> directories with <b>tar</b> command – already covered in <a href="https://www.tecmint.com/compress-files-and-finding-files-in-linux/" target="_blank">Part 3</a> of this series. You may consider using this method if you need to keep copies of specific files and directories (configuration files, users’ home directories, and so on).</p>
<p><b>Method 3</b>: Synchronize files with <b>rsync</b> command. Rsync is a versatile remote (and local) file-copying tool. If you need to backup and synchronize your files to/from network drives, rsync is a go.</p>
<p>Whether you’re synchronizing two local directories or local &lt; — &gt; remote directories mounted on the local filesystem, the basic syntax is the same.</p>
<h6>Synchronizing two local directories or local &lt; — &gt; remote directories mounted on the local filesystem</h6>
<pre># rsync -av source_directory destination directory
</pre>
<p>Where, <b>-a</b> recurse into subdirectories (if they exist), preserve symbolic links, timestamps, permissions, and original owner / group and <b>-v</b> verbose.</p>
<figure id="attachment_9425" aria-describedby="caption-attachment-9425" style="width: 487px" class="wp-caption aligncenter"><a href="https://www.tecmint.com/wp-content/uploads/2014/10/rsync-synchronizing-Files.png"><img src="https://www.tecmint.com/wp-content/uploads/2014/10/rsync-synchronizing-Files.png" loading="lazy" class="size-full wp-image-9425" alt="rsync Synchronizing Files" style="" data-lazy-loaded="true" width="497" height="212"><noscript>&lt;img loading="lazy" class="size-full wp-image-9425" src="https://www.tecmint.com/wp-content/uploads/2014/10/rsync-synchronizing-Files.png" alt="rsync Synchronizing Files" width="497" height="212" /&gt;</noscript></a><figcaption id="caption-attachment-9425" class="wp-caption-text">rsync Synchronizing Files</figcaption></figure>
<p>In addition, if you want to increase the security of the data transfer over the wire, you can use <b>ssh</b> over <b>rsync</b>.</p>
<h6>Synchronizing local → remote directories over ssh</h6>
<pre># rsync -avzhe ssh backups root@remote_host:/remote_directory/
</pre>
<p>This example will synchronize the backups directory on the local host with the contents of <b>/root/remote_directory</b> on the remote host.</p>
<p>Where the <b>-h</b> option shows file sizes in human-readable format, and the <b>-e</b> flag is used to indicate a ssh connection.</p>
<figure id="attachment_9426" aria-describedby="caption-attachment-9426" style="width: 610px" class="wp-caption aligncenter"><a href="https://www.tecmint.com/wp-content/uploads/2014/10/rsync-synchronize-Remote-Files.png"><img src="https://www.tecmint.com/wp-content/uploads/2014/10/rsync-synchronize-Remote-Files-620x184.png" loading="lazy" class="size-medium wp-image-9426" alt="rsync Synchronize Remote Files" srcset="https://www.tecmint.com/wp-content/uploads/2014/10/rsync-synchronize-Remote-Files-620x184.png 620w, https://www.tecmint.com/wp-content/uploads/2014/10/rsync-synchronize-Remote-Files-1024x304.png 1024w, https://www.tecmint.com/wp-content/uploads/2014/10/rsync-synchronize-Remote-Files.png 1180w" sizes="(max-width: 620px) 100vw, 620px" style="" data-lazy-loaded="true" width="620" height="184"><noscript>&lt;img loading="lazy" class="size-medium wp-image-9426" src="https://www.tecmint.com/wp-content/uploads/2014/10/rsync-synchronize-Remote-Files-620x184.png" alt="rsync Synchronize Remote Files" width="620" height="184" srcset="https://www.tecmint.com/wp-content/uploads/2014/10/rsync-synchronize-Remote-Files-620x184.png 620w, https://www.tecmint.com/wp-content/uploads/2014/10/rsync-synchronize-Remote-Files-1024x304.png 1024w, https://www.tecmint.com/wp-content/uploads/2014/10/rsync-synchronize-Remote-Files.png 1180w" sizes="(max-width: 620px) 100vw, 620px" /&gt;</noscript></a><figcaption id="caption-attachment-9426" class="wp-caption-text">rsync Synchronize Remote Files</figcaption></figure>
<p>Synchronizing remote → local directories over ssh.</p>
<p>In this case, switch the source and destination directories from the previous example.</p>
<pre># rsync -avzhe ssh root@remote_host:/remote_directory/ backups 
</pre>
<p>Please note that these are only 3 examples (most frequent cases you’re likely to run into) of the use of rsync. For more examples and usages of rsync commands can be found at the following article.</p>




