<h1 class="entry-title" itemprop="headline">Introduction to RAID, Concepts of RAID and RAID Levels – Part 1</h1>			<div class="entry-meta">
<span class="byline"><span class="author vcard" itemtype="http://schema.org/Person" itemscope="itemscope" itemprop="author"><a href="https://www.tecmint.com/author/babinlonston/" title="View all posts by Babin Lonston" rel="author"><span class="author-name" itemprop="name">Babin Lonston</span></a></span></span><span class="posted-on"><time class="updated" datetime="2015-10-08T16:07:50+05:30" itemprop="dateModified">October 8, 2015</time><time class="entry-date published" datetime="2014-10-13T15:58:21+05:30" itemprop="datePublished">October 13, 2014</time> </span><span class="cat-links"><span class="screen-reader-text">Categories </span><a href="https://www.tecmint.com/category/raid/" rel="category tag">Raid</a></span> <span class="comments-link"><a href="https://www.tecmint.com/understanding-raid-setup-in-linux/#comments">21 Comments</a></span> 			</div><!-- .entry-meta -->
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
<p><b>RAID</b> is a Redundant Array of Inexpensive disks, but nowadays it is called Redundant Array of Independent drives. Earlier it is used to be very costly to buy even a smaller size of disk, but nowadays we can buy a large size of disk with the same amount like before. Raid is just a collection of disks in a pool to become a logical volume.</p>
<figure id="attachment_9223" aria-describedby="caption-attachment-9223" style="width: 590px" class="wp-caption aligncenter"><a href="https://www.tecmint.com/wp-content/uploads/2014/10/RAID.jpg"><img src="https://www.tecmint.com/wp-content/uploads/2014/10/RAID.jpg" class="size-full wp-image-9223" alt="RAID in Linux" style="" data-lazy-loaded="true" width="600" height="400"><noscript>&lt;img class="size-full wp-image-9223" src="https://www.tecmint.com/wp-content/uploads/2014/10/RAID.jpg" alt="RAID in Linux" width="600" height="400" /&gt;</noscript></a><figcaption id="caption-attachment-9223" class="wp-caption-text">Understanding RAID Setups in Linux</figcaption></figure>
<p>Raid contains groups or sets or Arrays. A combine of drivers make a group of disks to form a RAID Array or RAID set. It can be a minimum of 2 number of disk connected to a raid controller and make a logical volume or more drives can be in a group. Only one Raid level can be applied in a group of disks. Raid are used when we need excellent performance. According to our selected raid level, performance will differ. Saving our data by fault tolerance &amp; high availability.</p>
<p>This series will be titled Preparation for the setting up RAID ‘s through Parts 1-9 and covers the following topics.</p>
<div id="exam_announcement"><b>Part 1</b>: <b>Introduction to RAID, Concepts of RAID and RAID Levels</b></div>
<div id="exam_announcement"><b>Part 2</b>: <a style="text-decoration: none;" href="https://www.tecmint.com/create-raid0-in-linux/" target="_blank">How to setup RAID0 (Stripe) in Linux</a></div>
<div id="exam_announcement"><b>Part 3</b>: <a style="text-decoration: none;" href="https://www.tecmint.com/create-raid1-in-linux/" target="_blank">How to setup RAID1 (Mirror) in Linux</a></div>
<div id="exam_announcement"><b>Part 4</b>: <a style="text-decoration: none;" href="https://www.tecmint.com/create-raid-5-in-linux/" target="_blank">How to setup RAID5 (Striping with Distributed Parity) in Linux</a></div>
<div id="exam_announcement"><b>Part 5</b>: <a style="text-decoration: none;" href="https://www.tecmint.com/create-raid-6-in-linux/" target="_blank">How to setup RAID6 (Striping with Double Distributed Parity) in Linux</a></div>
<div id="exam_announcement"><b>Part 6</b>: <a style="text-decoration: none;" href="https://www.tecmint.com/create-raid-10-in-linux/" target="_blank">Setting Up RAID 10 or 1+0 (Nested) in Linux</a></div>
<div id="exam_announcement"><b>Part 7</b>: <a style="text-decoration: none;" href="https://www.tecmint.com/grow-raid-array-in-linux/" target="_blank">Growing an Existing RAID Array and Removing Failed Disks in Raid</a></div>
<div id="exam_announcement"><b>Part 8</b>: <a style="text-decoration: none;" href="https://www.tecmint.com/recover-data-and-rebuild-failed-software-raid/" target="_blank">How to Recover Data and Rebuild Failed Software RAID’s</a></div>
<div id="exam_announcement"><b>Part 9</b>: <a style="text-decoration: none;" href="https://www.tecmint.com/manage-software-raid-devices-in-linux-with-mdadm/" target="_blank">How to Manage Software RAID’s in Linux with ‘Mdadm’ Tool</a></div>
<p>This is the Part 1 of a 9-tutorial series, here we will cover the introduction of RAID, Concepts of RAID and RAID Levels that are required for the setting up RAID in Linux.</p>
<h3>Software RAID and Hardware RAID</h3>
<p><b>Software RAID</b> have low performance, because of consuming resource from hosts. Raid software need to load for read data from software raid volumes. Before loading raid software, OS need to get boot to load the raid software. No need of Physical hardware in software raids. Zero cost investment.</p>
<center style="padding-bottom: 45px;padding-top:35px;"><div id="tecmint_incontent" align="center"><script data-cfasync="false" type="text/javascript">freestar.config.enabled_slots.push({ placementName: "tecmint_incontent", slotId: "tecmint_incontent" });</script></div></center><p><b>Hardware RAID</b> have high performance. They are dedicated RAID Controller which is Physically built using PCI express cards. It won’t use the host resource. They have NVRAM for cache to read and write. Stores cache while rebuild even if there is power-failure, it will store the cache using battery power backups. Very costly investments needed for a large scale.</p>
<p>Hardware RAID Card will look like below:</p>
<figure id="attachment_9172" aria-describedby="caption-attachment-9172" style="width: 490px" class="wp-caption aligncenter"><a href="https://www.tecmint.com/wp-content/uploads/2014/10/Hardware-RAID.jpg"><img src="https://www.tecmint.com/wp-content/uploads/2014/10/Hardware-RAID.jpg" loading="lazy" class="size-full wp-image-9172" alt="Hardware RAID" style="" data-lazy-loaded="true" width="500" height="329"><noscript>&lt;img loading="lazy" class="size-full wp-image-9172" src="https://www.tecmint.com/wp-content/uploads/2014/10/Hardware-RAID.jpg" alt="Hardware RAID" width="500" height="329" /&gt;</noscript></a><figcaption id="caption-attachment-9172" class="wp-caption-text">Hardware RAID</figcaption></figure>
<h4>Featured Concepts of RAID</h4>
<ol>
<li><b>Parity</b> method in raid regenerate the lost content from parity saved information’s. RAID 5, RAID 6 Based on Parity.</li>
<li><b>Stripe</b> is sharing data randomly to multiple disk. This won’t have full data in a single disk. If we use 3 disks half of our data will be in each disks.</li>
<li><b>Mirroring</b> is used in RAID 1 and RAID 10. Mirroring is making a copy of same data. In RAID 1 it will save the same content to the other disk too.</li>
<li><b>Hot spare</b> is just a spare drive in our server which can automatically replace the failed drives. If any one of the drive failed in our array this hot spare drive will be used and rebuild automatically.</li>
<li><b>Chunks</b> are just a size of data which can be minimum from 4KB and more. By defining chunk size we can increase the I/O performance.</li>
</ol>
<p>RAID’s are in various Levels. Here we will see only the RAID Levels which is used mostly in real environment.</p>
<ol>
<li><b>RAID0</b> = Striping</li>
<li><b>RAID1</b> = Mirroring</li>
<li><b>RAID5</b> = Single Disk Distributed Parity</li>
<li><b>RAID6</b> = Double Disk Distributed Parity</li>
<li><b>RAID10</b> = Combine of Mirror &amp; Stripe. (Nested RAID)</li>
</ol>
<p>RAID are managed using <b>mdadm</b> package in most of the Linux distributions. Let us get a Brief look into each RAID Levels.</p>
<h4>RAID 0 (or) Striping</h4>
<p>Striping have a excellent performance. In Raid 0 (Striping) the data will be written to disk using shared method. Half of the content will be in one disk and another half will be written to other disk.</p>
<p>Let us assume we have 2 Disk drives, for example, if we write data “<b>TECMINT</b>” to logical volume it will be saved as ‘<b>T</b>‘ will be saved in first disk and ‘<b>E</b>‘ will be saved in Second disk and ‘<b>C</b>‘ will be saved in First disk and again ‘<b>M</b>‘ will be saved in Second disk and it continues in round-robin process.</p>
<p>In this situation if any one of the drive fails we will loose our data, because with half of data from one of the disk can’t use to rebuilt the raid. But while comparing to Write Speed and performance RAID 0 is Excellent. We need at least minimum 2 disks to create a RAID 0 (Striping). If you need your valuable data don’t use this RAID LEVEL.</p>
<ol>
<li>High Performance.</li>
<li>There is Zero Capacity Loss in RAID 0</li>
<li>Zero Fault Tolerance.</li>
<li>Write and Reading will be good performance.</li>
</ol>
<h4>RAID 1 (or) Mirroring</h4>
<p>Mirroring have a good performance. Mirroring can make a copy of same data what we have. Assuming we have two numbers of 2TB Hard drives, total there we have 4TB, but in mirroring while the drives are behind the RAID Controller to form a Logical drive Only we can see the 2TB of logical drive.</p>
<p>While we save any data, it will write to both 2TB Drives. Minimum two drives are needed to create a RAID 1 or Mirror. If a disk failure occurred we can reproduce the raid set by replacing a new disk. If any one of the disk fails in RAID 1, we can get the data from other one as there was a copy of same content in the other disk. So there is zero data loss.</p>
<ol>
<li>Good Performance.</li>
<li>Here Half of the Space will be lost in total capacity.</li>
<li>Full Fault Tolerance.</li>
<li>Rebuilt will be faster.</li>
<li>Writing Performance will be slow.</li>
<li>Reading will be good.</li>
<li>Can be used for operating systems and database for small scale.</li>
</ol>
<h4>RAID 5 (or) Distributed Parity</h4>
<p>RAID 5 is mostly used in enterprise levels. RAID 5 work by distributed parity method. Parity info will be used to rebuild the data. It rebuilds from the information left on the remaining good drives. This will protect our data from drive failure.</p>
<p>Assume we have 4 drives, if one drive fails and while we replace the failed drive we can rebuild the replaced drive from parity informations. Parity information’s are Stored in all 4 drives, if we have 4 numbers of 1TB hard-drive. The parity information will be stored in 256GB in each drivers and other 768GB in each drives will be defined for Users. RAID 5 can be survive from a single Drive failure, If drives fails more than 1 will cause loss of data’s.</p>
<ol>
<li>Excellent Performance</li>
<li>Reading will be extremely very good in speed.</li>
<li>Writing will be Average, slow if we won’t use a Hardware RAID Controller.</li>
<li>Rebuild from Parity information from all drives.</li>
<li>Full Fault Tolerance.</li>
<li>1 Disk Space will be under Parity.</li>
<li>Can be used in file servers, web servers, very important backups.</li>
</ol>
<h4>RAID 6 Two Parity Distributed Disk</h4>
<p>RAID 6 is same as RAID 5 with two parity distributed system. Mostly used in a large number of arrays. We need minimum 4 Drives, even if there 2 Drive fails we can rebuild the data while replacing new drives.</p>
<p>Very slower than RAID 5, because it writes data to all 4 drivers at same time. Will be average in speed while we using a Hardware RAID Controller. If we have 6 numbers of 1TB hard-drives 4 drives will be used for data and 2 drives will be used for Parity.</p>
<ol>
<li>Poor Performance.</li>
<li>Read Performance will be good.</li>
<li>Write Performance will be Poor if we not using a Hardware RAID Controller.</li>
<li>Rebuild from 2 Parity Drives.</li>
<li>Full Fault tolerance.</li>
<li>2 Disks space will be under Parity.</li>
<li>Can be Used in Large Arrays.</li>
<li>Can be use in backup purpose, video streaming, used in large scale.</li>
</ol>
<h4>RAID 10 (or) Mirror &amp; Stripe</h4>
<p>RAID 10 can be called as 1+0 or 0+1. This will do both works of Mirror &amp; Striping. Mirror will be first and stripe will be the second in RAID 10. Stripe will be the first and mirror will be the second in RAID 01. RAID 10 is better comparing to 01.</p>
<p>Assume, we have 4 Number of drives. While I’m writing some data to my logical volume it will be saved under All 4 drives using mirror and stripe methods.</p>
<p>If I’m writing a data “<b>TECMINT</b>” in RAID 10 it will save the data as follow. First “<b>T</b>” will write to both disks and second “<b>E</b>” will write to both disk, this step will be used for all data write. It will make a copy of every data to other disk too.</p>
<p>Same time it will use the RAID 0 method and write data as follow “<b>T</b>” will write to first disk and “<b>E</b>” will write to second disk. Again “<b>C</b>” will write to first Disk and “<b>M</b>” to second disk.</p>
<ol>
<li>Good read and write performance.</li>
<li>Here Half of the Space will be lost in total capacity.</li>
<li>Fault Tolerance.</li>
<li>Fast rebuild from copying data.</li>
<li>Can be used in Database storage for high performance and availability.</li>