<h1 class="headline" itemprop="headline">RAID 2, RAID 3, RAID 4, RAID 6 Explained with Diagram</h1>

<p>In most critical production servers, you will be using either <a href="https://www.thegeekstuff.com/2010/08/raid-levels-tutorial/">RAID 5</a> or <a href="https://www.thegeekstuff.com/2011/10/raid10-vs-raid01/">RAID 10</a>.</p>
<p>However there are several non-standard raids, which are not used except in some rare situations. It is good to know what they are.</p>
<p>This article explains with a simple diagram how RAID 2, RAID 3, RAID 4, and RAID 6 works.<br>
<span id="more-8990"></span></p>
<h3>RAID 2</h3>
<img class="aligncenter size-full wp-image-8992" title="RAID 2" src="https://static.thegeekstuff.com/wp-content/uploads/2011/12/raid2.png" alt="" srcset="https://static.thegeekstuff.com/wp-content/uploads/2011/12/raid2.png 590w, https://static.thegeekstuff.com/wp-content/uploads/2011/12/raid2-300x157.png 300w" sizes="(max-width: 590px) 100vw, 590px" width="590" height="309">
<ul>
<li>This uses bit level striping. i.e Instead of striping the blocks across the disks, it stripes the bits across the disks.</li>
<li>In the above diagram b1, b2, b3 are bits. E1, E2, E3 are error correction codes.</li>
<li>You need two groups of disks. One group of disks are used to write the data, another group is used to write the error correction codes.</li>
<li>This uses Hamming error correction code (ECC), and stores this information in the redundancy disks.</li>
<li>When data is written to the disks, it calculates the ECC code for the data on the fly, and stripes the data bits to the data-disks, and writes the ECC code to the redundancy disks.</li>
<li>When data is read from the disks, it also reads the corresponding ECC code from the redundancy disks, and checks whether the data is consistent. If required, it makes appropriate corrections on the fly.</li>
<li><span>This uses lot of disks and can be configured in different disk configuration. Some valid configurations are 1) 10 disks for data and 4 disks for ECC 2) 4 disks for data and 3 disks for ECC</span></li>
<li>This is not used anymore. This is expensive and implementing it in a RAID controller is complex, and ECC is redundant now-a-days, as the hard disk themselves can do this.</li>
</ul>
<h3>RAID 3</h3>
<img loading="lazy" class="aligncenter size-full wp-image-8993" title="RAID 3" src="https://static.thegeekstuff.com/wp-content/uploads/2011/12/raid3.png" alt="" srcset="https://static.thegeekstuff.com/wp-content/uploads/2011/12/raid3.png 590w, https://static.thegeekstuff.com/wp-content/uploads/2011/12/raid3-300x160.png 300w" sizes="(max-width: 590px) 100vw, 590px" width="590" height="315">
<ul>
<li>This uses byte level striping. i.e Instead of striping the blocks across the disks, it stripes the bytes across the disks.</li>
<li>In the above diagram B1, B2, B3 are bytes. p1, p2, p3 are parities.</li>
<li>Uses multiple data disks, and a dedicated disk to store parity.</li>
<li>The disks have to spin in sync to get to the data.</li>
<li>Sequential read and write will have good performance.</li>
<li><span>Random read and write will have worst performance.</span></li>
<li>This is not commonly used.</li>
</ul>
<h3>RAID 4</h3>
<img loading="lazy" class="aligncenter size-full wp-image-8994" title="raid4" src="https://static.thegeekstuff.com/wp-content/uploads/2011/12/raid4.png" alt="" srcset="https://static.thegeekstuff.com/wp-content/uploads/2011/12/raid4.png 590w, https://static.thegeekstuff.com/wp-content/uploads/2011/12/raid4-300x160.png 300w" sizes="(max-width: 590px) 100vw, 590px" width="590" height="315">
<ul>
<li>This uses block level striping.</li>
<li>In the above diagram B1, B2, B3 are blocks. p1, p2, p3 are parities.</li>
<li>Uses multiple data disks, and a dedicated disk to store parity.</li>
<li>Minimum of 3 disks (2 disks for data and 1 for parity)</li>
<li>Good random reads, as the data blocks are striped.</li>
<li>Bad random writes, as for every write, it has to write to the single parity disk.</li>
<li>It is somewhat similar to RAID 3 and 5, but a little different.</li>
<li>This is just like RAID 3 in having the dedicated parity disk, but this stripes blocks.</li>
<li>This is just like RAID 5 in striping the blocks across the data disks, but this has only one parity disk.</li>
<li>This is not commonly used.</li>
</ul>
<h3>RAID 6</h3>
<img loading="lazy" class="aligncenter size-full wp-image-8995" title="raid 6" src="https://static.thegeekstuff.com/wp-content/uploads/2011/12/raid6.png" alt="" srcset="https://static.thegeekstuff.com/wp-content/uploads/2011/12/raid6.png 590w, https://static.thegeekstuff.com/wp-content/uploads/2011/12/raid6-300x152.png 300w" sizes="(max-width: 590px) 100vw, 590px" width="590" height="299">
<ul>
<li>Just like RAID 5, this does block level striping. However, it uses dual parity.</li>
<li>In the above diagram A, B, C are blocks. p1, p2, p3 are parities.</li>
<li>This creates two parity blocks for each data block.</li>
<li>Can handle two disk failure</li>
<li>This RAID configuration is complex to implement in a RAID controller, as it has to calculate two parity data for each data block.</li>
