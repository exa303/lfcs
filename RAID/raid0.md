<h1 class="entry-title" itemprop="headline">Creating Software RAID0 (Stripe) on ‘Two Devices’ Using ‘mdadm’ Tool in Linux – Part 2</h1>			<div class="entry-meta">
<span class="byline"><span class="author vcard" itemtype="http://schema.org/Person" itemscope="itemscope" itemprop="author"><a href="https://www.tecmint.com/author/babinlonston/" title="View all posts by Babin Lonston" rel="author"><span class="author-name" itemprop="name">Babin Lonston</span></a></span></span><span class="posted-on"><time class="updated" datetime="2015-09-19T14:23:41+05:30" itemprop="dateModified">September 19, 2015</time><time class="entry-date published" datetime="2014-10-17T17:23:56+05:30" itemprop="datePublished">October 17, 2014</time> </span><span class="cat-links"><span class="screen-reader-text">Categories </span><a href="https://www.tecmint.com/category/raid/" rel="category tag">Raid</a></span> <span class="comments-link"><a href="https://www.tecmint.com/create-raid0-in-linux/#comments">38 Comments</a></span> 			</div><!-- .entry-meta -->
<center style="padding-bottom:20px;padding-top:40px;">
<!-- Tag ID: tecmint_leaderboard_article_top -->
<div id="tecmint_leaderboard_article_top" align="center">
<script data-cfasync="false" type="text/javascript">
freestar.config.enabled_slots.push({ placementName: "tecmint_leaderboard_article_top", slotId: "tecmint_leaderboard_article_top" });
</script>
</div>
</center>
</header><!-- .entry-header -->
<div class="entry-content" itemprop="text">
<p><strong>RAID</strong> is Redundant Array of Inexpensive disks, used for high availability and reliability in large scale environments, where data need to be protected than normal use. Raid is just a collection of disks in a pool to become a logical volume and contains an array. A combine drivers makes an array or called as set of (group).</p>
<p>RAID can be created, if there are minimum 2 number of disk connected to a raid controller and make a logical volume or more drives can be added in an array according to defined RAID Levels. Software Raid are available without using Physical hardware those are called as software raid. Software Raid will be named as Poor man raid.</p>
<figure id="attachment_9289" aria-describedby="caption-attachment-9289" style="width: 590px" class="wp-caption aligncenter"><a href="https://www.tecmint.com/wp-content/uploads/2014/10/Raid0-in-Linux.jpg"><img src="https://www.tecmint.com/wp-content/uploads/2014/10/Raid0-in-Linux.jpg" class="size-full wp-image-9289" alt="Setup RAID0 in Linux" style="" data-lazy-loaded="true" width="600" height="400"><noscript>&lt;img class="size-full wp-image-9289" src="https://www.tecmint.com/wp-content/uploads/2014/10/Raid0-in-Linux.jpg" alt="Setup RAID0 in Linux" width="600" height="400" /&gt;</noscript></a><figcaption id="caption-attachment-9289" class="wp-caption-text">Setup RAID0 in Linux</figcaption></figure>
<p>Main concept of using RAID is to save data from Single point of failure, means if we using a single disk to store the data and if it’s failed, then there is no chance of getting our data back, to stop the data loss we need a fault tolerance method. So, that we can use some collection of disk to form a RAID set.</p>
<h4>What is Stripe in RAID 0?</h4>
<p>Stripe is striping data across multiple disk at the same time by dividing the contents. Assume we have two disks and if we save content to logical volume it will be saved under both two physical disks by dividing the content. For better performance <strong>RAID 0</strong> will be used, but we can’t get the data if one of the drive fails. So, it isn’t a good practice to use RAID 0. The only solution is to install operating system with RAID0 applied logical volumes to safe your important files.</p>
<ol>
<li>RAID 0 has High Performance.</li>
<li>Zero Capacity Loss in RAID 0. No Space will be wasted.</li>
<li>Zero Fault Tolerance ( Can’t get back the data if any one of disk fails).</li>
<li>Write and Reading will be Excellent.</li>
</ol>
<h4>Requirements</h4>
<p>Minimum number of disks are allowed to create RAID 0 is <strong>2</strong>, but you can add more disk but the order should be twice as 2, 4, 6, 8. If you have a Physical RAID card with enough ports, you can add more disks.</p>
<center style="padding-bottom: 45px;padding-top:35px;"><div id="tecmint_incontent" align="center"><script data-cfasync="false" type="text/javascript">freestar.config.enabled_slots.push({ placementName: "tecmint_incontent", slotId: "tecmint_incontent" });</script></div></center><p>Here we are not using a Hardware raid, this setup depends only on Software RAID. If we have a physical hardware raid card we can access it from it’s utility <strong>UI</strong>. Some motherboard by default in-build with RAID feature, there <strong>UI</strong> can be accessed using <b>Ctrl+I</b> keys.</p>
<p>If you’re new to RAID setups, please read our earlier article, where we’ve covered some basic introduction of about RAID.</p>
<ol>
<li><a href="https://www.tecmint.com/understanding-raid-setup-in-linux/" target="_blank">Introduction to RAID and RAID Concepts</a></li>
</ol>
<h5>My Server Setup</h5>
<pre>Operating System :	CentOS 6.5 Final
IP Address	 :	192.168.0.225
Two Disks	 :	20 GB each
</pre>
<p>This article is Part 2 of a 9-tutorial RAID series, here in this part, we are going to see how we can create and setup Software <strong>RAID0</strong> or striping in Linux systems or servers using two <strong>20GB</strong> disks named <b>sdb</b> and <b>sdc</b>.</p>
<h3>Step 1: Updating System and Installing mdadm for Managing RAID</h3>
<p><strong>1.</strong> Before setting up RAID0 in Linux, let’s do a system update and then install ‘<strong>mdadm</strong>‘ package. The mdadm is a small program, which will allow us to configure and manage RAID devices in Linux.</p>
<pre># yum clean all &amp;&amp; yum update
# yum install mdadm -y
</pre>
<figure id="attachment_9275" aria-describedby="caption-attachment-9275" style="width: 487px" class="wp-caption aligncenter"><a href="https://www.tecmint.com/wp-content/uploads/2014/10/install-mdadm-in-linux.png"><img src="https://www.tecmint.com/wp-content/uploads/2014/10/install-mdadm-in-linux.png" loading="lazy" class="size-full wp-image-9275" alt="install mdadm in linux" style="" data-lazy-loaded="true" width="497" height="222"><noscript>&lt;img loading="lazy" class="size-full wp-image-9275" src="https://www.tecmint.com/wp-content/uploads/2014/10/install-mdadm-in-linux.png" alt="install mdadm in linux" width="497" height="222" /&gt;</noscript></a><figcaption id="caption-attachment-9275" class="wp-caption-text">Install mdadm Tool</figcaption></figure>
<h3>Step 2: Verify Attached Two 20GB Drives</h3>
<p><strong>2.</strong> Before creating RAID 0, make sure to verify that the attached two hard drives are detected or not, using the following command.</p>
<pre># ls -l /dev | grep sd
</pre>
<figure id="attachment_9276" aria-describedby="caption-attachment-9276" style="width: 443px" class="wp-caption aligncenter"><a href="https://www.tecmint.com/wp-content/uploads/2014/10/Check-Hard-Drives.png"><img src="https://www.tecmint.com/wp-content/uploads/2014/10/Check-Hard-Drives.png" loading="lazy" class="size-full wp-image-9276" alt="Check Hard Drives in Linux" style="" data-lazy-loaded="true" width="453" height="164"><noscript>&lt;img loading="lazy" class="size-full wp-image-9276" src="https://www.tecmint.com/wp-content/uploads/2014/10/Check-Hard-Drives.png" alt="Check Hard Drives in Linux" width="453" height="164" /&gt;</noscript></a><figcaption id="caption-attachment-9276" class="wp-caption-text">Check Hard Drives</figcaption></figure>
<p><strong>3.</strong> Once the new hard drives detected, it’s time to check whether the attached drives are already using any existing raid with the help of following ‘mdadm’ command.</p>
<pre># mdadm --examine /dev/sd[b-c]
</pre>
<figure id="attachment_9277" aria-describedby="caption-attachment-9277" style="width: 411px" class="wp-caption aligncenter"><a href="https://www.tecmint.com/wp-content/uploads/2014/10/Check-Drives-using-RAID.png"><img src="https://www.tecmint.com/wp-content/uploads/2014/10/Check-Drives-using-RAID.png" loading="lazy" class="size-full wp-image-9277" alt="Check RAID Devices in Linux" style="" data-lazy-loaded="true" width="421" height="127"><noscript>&lt;img loading="lazy" class="size-full wp-image-9277" src="https://www.tecmint.com/wp-content/uploads/2014/10/Check-Drives-using-RAID.png" alt="Check RAID Devices in Linux" width="421" height="127" /&gt;</noscript></a><figcaption id="caption-attachment-9277" class="wp-caption-text">Check RAID Devices</figcaption></figure>
<p>In the above output, we come to know that none of the RAID have been applied to these two <b>sdb</b> and <b>sdc</b> drives.</p>
<h3>Step 3: Creating Partitions for RAID</h3>
<p><strong>4.</strong> Now create <b>sdb</b> and <b>sdc</b> partitions for raid, with the help of following fdisk command. Here, I will show how to create partition on <b>sdb</b> drive.</p>
<pre># fdisk /dev/sdb
</pre>
<p>Follow below instructions for creating partitions.</p>
<ol>
<li>Press ‘<strong>n</strong>‘ for creating new partition.</li>
<li>Then choose ‘<strong>P</strong>‘ for Primary partition.</li>
<li>Next select the partition number as <strong>1</strong>.</li>
<li>Give the default value by just pressing two times <strong>Enter</strong> key.</li>
<li>Next press ‘<strong>P</strong>‘ to print the defined partition.</li>
</ol>
<figure id="attachment_9278" aria-describedby="caption-attachment-9278" style="width: 351px" class="wp-caption aligncenter"><a href="https://www.tecmint.com/wp-content/uploads/2014/10/Create-Partitions-in-Linux.png"><img src="https://www.tecmint.com/wp-content/uploads/2014/10/Create-Partitions-in-Linux-361x450.png" loading="lazy" class="size-medium wp-image-9278" alt="Create Partitions in Linux" srcset="https://www.tecmint.com/wp-content/uploads/2014/10/Create-Partitions-in-Linux-361x450.png 361w, https://www.tecmint.com/wp-content/uploads/2014/10/Create-Partitions-in-Linux.png 542w" sizes="(max-width: 361px) 100vw, 361px" style="" data-lazy-loaded="true" width="361" height="450"><noscript>&lt;img loading="lazy" class="size-medium wp-image-9278" src="https://www.tecmint.com/wp-content/uploads/2014/10/Create-Partitions-in-Linux-361x450.png" alt="Create Partitions in Linux" width="361" height="450" srcset="https://www.tecmint.com/wp-content/uploads/2014/10/Create-Partitions-in-Linux-361x450.png 361w, https://www.tecmint.com/wp-content/uploads/2014/10/Create-Partitions-in-Linux.png 542w" sizes="(max-width: 361px) 100vw, 361px" /&gt;</noscript></a><figcaption id="caption-attachment-9278" class="wp-caption-text">Create Partitions</figcaption></figure>
<p>Follow below instructions for creating Linux raid auto on partitions.</p>
<ol>
<li>Press ‘<strong>L</strong>‘ to list all available types.</li>
<li>Type ‘<strong>t</strong>‘to choose the partitions.</li>
<li>Choose ‘<strong>fd</strong>‘ for Linux raid auto and press Enter to apply.</li>
<li>Then again use ‘<strong>P</strong>‘ to print the changes what we have made.</li>
<li>Use ‘<strong>w</strong>‘ to write the changes.</li>
</ol>
<figure id="attachment_9279" aria-describedby="caption-attachment-9279" style="width: 363px" class="wp-caption aligncenter"><a href="https://www.tecmint.com/wp-content/uploads/2014/10/Create-RAID-Partitions.png"><img src="https://www.tecmint.com/wp-content/uploads/2014/10/Create-RAID-Partitions-373x450.png" loading="lazy" class="size-medium wp-image-9279" alt="Create RAID Partitions" srcset="https://www.tecmint.com/wp-content/uploads/2014/10/Create-RAID-Partitions-373x450.png 373w, https://www.tecmint.com/wp-content/uploads/2014/10/Create-RAID-Partitions.png 664w" sizes="(max-width: 373px) 100vw, 373px" style="" data-lazy-loaded="true" width="373" height="450"><noscript>&lt;img loading="lazy" class="size-medium wp-image-9279" src="https://www.tecmint.com/wp-content/uploads/2014/10/Create-RAID-Partitions-373x450.png" alt="Create RAID Partitions" width="373" height="450" srcset="https://www.tecmint.com/wp-content/uploads/2014/10/Create-RAID-Partitions-373x450.png 373w, https://www.tecmint.com/wp-content/uploads/2014/10/Create-RAID-Partitions.png 664w" sizes="(max-width: 373px) 100vw, 373px" /&gt;</noscript></a><figcaption id="caption-attachment-9279" class="wp-caption-text">Create RAID Partitions in Linux</figcaption></figure>
<p><strong style="color: red;">Note</strong>: Please follow same above instructions to create partition on <b>sdc</b> drive now.</p>
<p><strong>5.</strong> After creating partitions, verify both the drivers are correctly defined for RAID using following command.</p>
<pre># mdadm --examine /dev/sd[b-c]
# mdadm --examine /dev/sd[b-c]1
</pre>
<figure id="attachment_9280" aria-describedby="caption-attachment-9280" style="width: 492px" class="wp-caption aligncenter"><a href="https://www.tecmint.com/wp-content/uploads/2014/10/Verify-RAID-Partitions.png"><img src="https://www.tecmint.com/wp-content/uploads/2014/10/Verify-RAID-Partitions.png" loading="lazy" class="size-full wp-image-9280" alt="Verify RAID Partitions" style="" data-lazy-loaded="true" width="502" height="289"><noscript>&lt;img loading="lazy" class="size-full wp-image-9280" src="https://www.tecmint.com/wp-content/uploads/2014/10/Verify-RAID-Partitions.png" alt="Verify RAID Partitions" width="502" height="289" /&gt;</noscript></a><figcaption id="caption-attachment-9280" class="wp-caption-text">Verify RAID Partitions</figcaption></figure>
<h3>Step 4: Creating RAID md Devices</h3>
<p><strong>6.</strong> Now create md device (i.e. <strong>/dev/md0</strong>) and apply raid level using below command.</p>
<pre># mdadm -C /dev/md0 -l raid0 -n 2 /dev/sd[b-c]1
# mdadm --create /dev/md0 --level=stripe --raid-devices=2 /dev/sd[b-c]1
</pre>
<ol>
<li><b>-C</b> – create</li>
<li><b>-l</b> – level</li>
<li><b>-n</b> – No of raid-devices</li>
</ol>
<p><strong>7.</strong> Once md device has been created, now verify the status of <strong>RAID Level</strong>, <strong>Devices</strong> and <strong>Array</strong> used, with the help of following series of commands as shown.</p>
<pre># cat /proc/mdstat
</pre>
<figure id="attachment_9281" aria-describedby="caption-attachment-9281" style="width: 498px" class="wp-caption aligncenter"><a href="https://www.tecmint.com/wp-content/uploads/2014/10/Verify-RAID-Level.png"><img src="https://www.tecmint.com/wp-content/uploads/2014/10/Verify-RAID-Level.png" loading="lazy" class="size-full wp-image-9281" alt="Verify RAID Level" style="" data-lazy-loaded="true" width="508" height="266"><noscript>&lt;img loading="lazy" class="size-full wp-image-9281" src="https://www.tecmint.com/wp-content/uploads/2014/10/Verify-RAID-Level.png" alt="Verify RAID Level" width="508" height="266" /&gt;</noscript></a><figcaption id="caption-attachment-9281" class="wp-caption-text">Verify RAID Level</figcaption></figure>
<pre># mdadm -E /dev/sd[b-c]1
</pre>
<figure id="attachment_9282" aria-describedby="caption-attachment-9282" style="width: 322px" class="wp-caption aligncenter"><a href="https://www.tecmint.com/wp-content/uploads/2014/10/Verify-RAID-Device.png"><img src="https://www.tecmint.com/wp-content/uploads/2014/10/Verify-RAID-Device-332x450.png" loading="lazy" class="size-medium wp-image-9282" alt="Verify RAID Device" srcset="https://www.tecmint.com/wp-content/uploads/2014/10/Verify-RAID-Device-332x450.png 332w, https://www.tecmint.com/wp-content/uploads/2014/10/Verify-RAID-Device.png 643w" sizes="(max-width: 332px) 100vw, 332px" style="" data-lazy-loaded="true" width="332" height="450"><noscript>&lt;img loading="lazy" class="size-medium wp-image-9282" src="https://www.tecmint.com/wp-content/uploads/2014/10/Verify-RAID-Device-332x450.png" alt="Verify RAID Device" width="332" height="450" srcset="https://www.tecmint.com/wp-content/uploads/2014/10/Verify-RAID-Device-332x450.png 332w, https://www.tecmint.com/wp-content/uploads/2014/10/Verify-RAID-Device.png 643w" sizes="(max-width: 332px) 100vw, 332px" /&gt;</noscript></a><figcaption id="caption-attachment-9282" class="wp-caption-text">Verify RAID Device</figcaption></figure>
<pre># mdadm --detail /dev/md0
</pre>
<figure id="attachment_9283" aria-describedby="caption-attachment-9283" style="width: 583px" class="wp-caption aligncenter"><a href="https://www.tecmint.com/wp-content/uploads/2014/10/Verify-RAID-Array.png"><img src="https://www.tecmint.com/wp-content/uploads/2014/10/Verify-RAID-Array-593x450.png" loading="lazy" class="size-medium wp-image-9283" alt="Verify RAID Array" srcset="https://www.tecmint.com/wp-content/uploads/2014/10/Verify-RAID-Array-593x450.png 593w, https://www.tecmint.com/wp-content/uploads/2014/10/Verify-RAID-Array.png 663w" sizes="(max-width: 593px) 100vw, 593px" style="" data-lazy-loaded="true" width="593" height="450"><noscript>&lt;img loading="lazy" class="size-medium wp-image-9283" src="https://www.tecmint.com/wp-content/uploads/2014/10/Verify-RAID-Array-593x450.png" alt="Verify RAID Array" width="593" height="450" srcset="https://www.tecmint.com/wp-content/uploads/2014/10/Verify-RAID-Array-593x450.png 593w, https://www.tecmint.com/wp-content/uploads/2014/10/Verify-RAID-Array.png 663w" sizes="(max-width: 593px) 100vw, 593px" /&gt;</noscript></a><figcaption id="caption-attachment-9283" class="wp-caption-text">Verify RAID Array</figcaption></figure>
<h3>Step 5: Assiging RAID Devices to Filesystem</h3>
<p><strong>8.</strong> Create a ext4 filesystem for a RAID device <strong>/dev/md0</strong> and mount it under <strong>/dev/raid0</strong>.</p>
<pre># mkfs.ext4 /dev/md0
</pre>
<figure id="attachment_9284" aria-describedby="caption-attachment-9284" style="width: 562px" class="wp-caption aligncenter"><a href="https://www.tecmint.com/wp-content/uploads/2014/10/Create-ext4-Filesystem.png"><img src="https://www.tecmint.com/wp-content/uploads/2014/10/Create-ext4-Filesystem-572x450.png" loading="lazy" class="size-medium wp-image-9284" alt="Create ext4 Filesystem in Linux" srcset="https://www.tecmint.com/wp-content/uploads/2014/10/Create-ext4-Filesystem-572x450.png 572w, https://www.tecmint.com/wp-content/uploads/2014/10/Create-ext4-Filesystem.png 636w" sizes="(max-width: 572px) 100vw, 572px" style="" data-lazy-loaded="true" width="572" height="450"><noscript>&lt;img loading="lazy" class="size-medium wp-image-9284" src="https://www.tecmint.com/wp-content/uploads/2014/10/Create-ext4-Filesystem-572x450.png" alt="Create ext4 Filesystem in Linux" width="572" height="450" srcset="https://www.tecmint.com/wp-content/uploads/2014/10/Create-ext4-Filesystem-572x450.png 572w, https://www.tecmint.com/wp-content/uploads/2014/10/Create-ext4-Filesystem.png 636w" sizes="(max-width: 572px) 100vw, 572px" /&gt;</noscript></a><figcaption id="caption-attachment-9284" class="wp-caption-text">Create ext4 Filesystem</figcaption></figure>
<p><strong>9.</strong> Once ext4 filesystem has been created for Raid device, now create a mount point directory (i.e.<strong> /mnt/raid0</strong>) and mount the device <strong>/dev/md0</strong> under it.</p>
<pre># mkdir /mnt/raid0
# mount /dev/md0 /mnt/raid0/
</pre>
<p><strong>10.</strong> Next, verify that the device <strong>/dev/md0</strong> is mounted under <strong>/mnt/raid0</strong> directory using <strong>df</strong> command.</p>
<pre># df -h
</pre>
<p><strong>11.</strong> Next, create a file called ‘<strong>tecmint.txt</strong>‘ under the mount point <strong>/mnt/raid0</strong>, add some content to the created file and view the content of a file and directory.</p>
<pre># touch /mnt/raid0/tecmint.txt
# echo "Hi everyone how you doing ?" &gt; /mnt/raid0/tecmint.txt
# cat /mnt/raid0/tecmint.txt
# ls -l /mnt/raid0/
</pre>
<figure id="attachment_9285" aria-describedby="caption-attachment-9285" style="width: 578px" class="wp-caption aligncenter"><a href="https://www.tecmint.com/wp-content/uploads/2014/10/Verify-Mount-Device.png"><img src="https://www.tecmint.com/wp-content/uploads/2014/10/Verify-Mount-Device-588x450.png" loading="lazy" class="size-medium wp-image-9285" alt="Verify Mount Device" srcset="https://www.tecmint.com/wp-content/uploads/2014/10/Verify-Mount-Device-588x450.png 588w, https://www.tecmint.com/wp-content/uploads/2014/10/Verify-Mount-Device.png 602w" sizes="(max-width: 588px) 100vw, 588px" style="" data-lazy-loaded="true" width="588" height="450"><noscript>&lt;img loading="lazy" class="size-medium wp-image-9285" src="https://www.tecmint.com/wp-content/uploads/2014/10/Verify-Mount-Device-588x450.png" alt="Verify Mount Device" width="588" height="450" srcset="https://www.tecmint.com/wp-content/uploads/2014/10/Verify-Mount-Device-588x450.png 588w, https://www.tecmint.com/wp-content/uploads/2014/10/Verify-Mount-Device.png 602w" sizes="(max-width: 588px) 100vw, 588px" /&gt;</noscript></a><figcaption id="caption-attachment-9285" class="wp-caption-text">Verify Mount Device</figcaption></figure>
<p><strong>12.</strong> Once you’ve verified mount points, it’s time to create an fstab entry in <strong>/etc/fstab</strong> file.</p>
<pre># vim /etc/fstab
</pre>
<p>Add the following entry as described. May vary according to your mount location and filesystem you using.</p>
<pre>/dev/md0                /mnt/raid0              ext4    defaults         0 0
</pre>
<figure id="attachment_9286" aria-describedby="caption-attachment-9286" style="width: 610px" class="wp-caption aligncenter"><a href="https://www.tecmint.com/wp-content/uploads/2014/10/Add-Device-to-Fstab.png"><img src="https://www.tecmint.com/wp-content/uploads/2014/10/Add-Device-to-Fstab-620x312.png" loading="lazy" class="size-medium wp-image-9286" alt="Add Device to Fstab" srcset="https://www.tecmint.com/wp-content/uploads/2014/10/Add-Device-to-Fstab-620x312.png 620w, https://www.tecmint.com/wp-content/uploads/2014/10/Add-Device-to-Fstab.png 668w" sizes="(max-width: 620px) 100vw, 620px" style="" data-lazy-loaded="true" width="620" height="312"><noscript>&lt;img loading="lazy" class="size-medium wp-image-9286" src="https://www.tecmint.com/wp-content/uploads/2014/10/Add-Device-to-Fstab-620x312.png" alt="Add Device to Fstab" width="620" height="312" srcset="https://www.tecmint.com/wp-content/uploads/2014/10/Add-Device-to-Fstab-620x312.png 620w, https://www.tecmint.com/wp-content/uploads/2014/10/Add-Device-to-Fstab.png 668w" sizes="(max-width: 620px) 100vw, 620px" /&gt;</noscript></a><figcaption id="caption-attachment-9286" class="wp-caption-text">Add Device to Fstab</figcaption></figure>
<p><strong>13.</strong> Run mount ‘<strong>-a</strong>‘ to check if there is any error in fstab entry.</p>
<pre># mount -av
</pre>
<figure id="attachment_9287" aria-describedby="caption-attachment-9287" style="width: 584px" class="wp-caption aligncenter"><a href="https://www.tecmint.com/wp-content/uploads/2014/10/Check-Errors-in-Fstab.png"><img src="https://www.tecmint.com/wp-content/uploads/2014/10/Check-Errors-in-Fstab.png" loading="lazy" class="size-full wp-image-9287" alt="Check Errors in Fstab" style="" data-lazy-loaded="true" width="594" height="214"><noscript>&lt;img loading="lazy" class="size-full wp-image-9287" src="https://www.tecmint.com/wp-content/uploads/2014/10/Check-Errors-in-Fstab.png" alt="Check Errors in Fstab" width="594" height="214" /&gt;</noscript></a><figcaption id="caption-attachment-9287" class="wp-caption-text">Check Errors in Fstab</figcaption></figure>
<h3>Step 6: Saving RAID Configurations</h3>
<p><strong>14.</strong> Finally, save the raid configuration to one of the file to keep the configurations for future use. Again we use ‘mdadm’ command with ‘<strong>-s</strong>‘ (scan) and ‘<strong>-v</strong>‘ (verbose) options as shown.</p>
<pre># mdadm -E -s -v &gt;&gt; /etc/mdadm.conf
# mdadm --detail --scan --verbose &gt;&gt; /etc/mdadm.conf
# cat /etc/mdadm.conf
</pre>
<figure id="attachment_9288" aria-describedby="caption-attachment-9288" style="width: 610px" class="wp-caption aligncenter"><a href="https://www.tecmint.com/wp-content/uploads/2014/10/Save-RAID-Configurations.png"><img src="https://www.tecmint.com/wp-content/uploads/2014/10/Save-RAID-Configurations-620x148.png" loading="lazy" class="size-medium wp-image-9288" alt="Save RAID Configurations" srcset="https://www.tecmint.com/wp-content/uploads/2014/10/Save-RAID-Configurations-620x148.png 620w, https://www.tecmint.com/wp-content/uploads/2014/10/Save-RAID-Configurations.png 739w" sizes="(max-width: 620px) 100vw, 620px" style="" data-lazy-loaded="true" width="620" height="148"><noscript>&lt;img loading="lazy" class="size-medium wp-image-9288" src="https://www.tecmint.com/wp-content/uploads/2014/10/Save-RAID-Configurations-620x148.png" alt="Save RAID Configurations" width="620" height="148" srcset="https://www.tecmint.com/wp-content/uploads/2014/10/Save-RAID-Configurations-620x148.png 620w, https://www.tecmint.com/wp-content/uploads/2014/10/Save-RAID-Configurations.png 739w" sizes="(max-width: 620px) 100vw, 620px" /&gt;</noscript></a><figcaption id="caption-attachment-9288" class="wp-caption-text">Save RAID Configurations</figcaption></figure>
