
<div id="toc" class="toc" role="navigation" aria-labelledby="mw-toc-heading"><input type="checkbox" role="button" id="toctogglecheckbox" class="toctogglecheckbox" style="display:none" /><div class="toctitle" lang="en" dir="ltr"><h2 id="mw-toc-heading">Contents</h2><span class="toctogglespan"><label class="toctogglelabel" for="toctogglecheckbox"></label></span></div>
<ul>
<li class="toclevel-1 tocsection-1"><a href="#Preparation"><span class="tocnumber">1</span> <span class="toctext">Preparation</span></a></li>
<li class="toclevel-1 tocsection-2"><a href="#Cryptsetup_usage"><span class="tocnumber">2</span> <span class="toctext">Cryptsetup usage</span></a>
<ul>
<li class="toclevel-2 tocsection-3"><a href="#Cryptsetup_passphrases_and_keys"><span class="tocnumber">2.1</span> <span class="toctext">Cryptsetup passphrases and keys</span></a></li>
</ul>
</li>
<li class="toclevel-1 tocsection-4"><a href="#Encryption_options_with_dm-crypt"><span class="tocnumber">3</span> <span class="toctext">Encryption options with dm-crypt</span></a>
<ul>
<li class="toclevel-2 tocsection-5"><a href="#Encryption_options_for_LUKS_mode"><span class="tocnumber">3.1</span> <span class="toctext">Encryption options for LUKS mode</span></a>
<ul>
<li class="toclevel-3 tocsection-6"><a href="#Iteration_time"><span class="tocnumber">3.1.1</span> <span class="toctext">Iteration time</span></a></li>
<li class="toclevel-3 tocsection-7"><a href="#Sector_size"><span class="tocnumber">3.1.2</span> <span class="toctext">Sector size</span></a></li>
</ul>
</li>
<li class="toclevel-2 tocsection-8"><a href="#Encryption_options_for_plain_mode"><span class="tocnumber">3.2</span> <span class="toctext">Encryption options for plain mode</span></a></li>
</ul>
</li>
<li class="toclevel-1 tocsection-9"><a href="#Encrypting_devices_with_cryptsetup"><span class="tocnumber">4</span> <span class="toctext">Encrypting devices with cryptsetup</span></a>
<ul>
<li class="toclevel-2 tocsection-10"><a href="#Encrypting_devices_with_LUKS_mode"><span class="tocnumber">4.1</span> <span class="toctext">Encrypting devices with LUKS mode</span></a>
<ul>
<li class="toclevel-3 tocsection-11"><a href="#Formatting_LUKS_partitions"><span class="tocnumber">4.1.1</span> <span class="toctext">Formatting LUKS partitions</span></a>
<ul>
<li class="toclevel-4 tocsection-12"><a href="#Using_LUKS_to_format_partitions_with_a_keyfile"><span class="tocnumber">4.1.1.1</span> <span class="toctext">Using LUKS to format partitions with a keyfile</span></a></li>
</ul>
</li>
<li class="toclevel-3 tocsection-13"><a href="#Unlocking/Mapping_LUKS_partitions_with_the_device_mapper"><span class="tocnumber">4.1.2</span> <span class="toctext">Unlocking/Mapping LUKS partitions with the device mapper</span></a></li>
<li class="toclevel-3 tocsection-14"><a href="#Using_a_TPM_to_store_keys"><span class="tocnumber">4.1.3</span> <span class="toctext">Using a TPM to store keys</span></a></li>
</ul>
</li>
<li class="toclevel-2 tocsection-15"><a href="#Encrypting_devices_with_plain_mode"><span class="tocnumber">4.2</span> <span class="toctext">Encrypting devices with plain mode</span></a></li>
</ul>
</li>
<li class="toclevel-1 tocsection-16"><a href="#Cryptsetup_actions_specific_for_LUKS"><span class="tocnumber">5</span> <span class="toctext">Cryptsetup actions specific for LUKS</span></a>
<ul>
<li class="toclevel-2 tocsection-17"><a href="#Key_management"><span class="tocnumber">5.1</span> <span class="toctext">Key management</span></a>
<ul>
<li class="toclevel-3 tocsection-18"><a href="#Adding_LUKS_keys"><span class="tocnumber">5.1.1</span> <span class="toctext">Adding LUKS keys</span></a></li>
<li class="toclevel-3 tocsection-19"><a href="#Removing_LUKS_keys"><span class="tocnumber">5.1.2</span> <span class="toctext">Removing LUKS keys</span></a></li>
</ul>
</li>
<li class="toclevel-2 tocsection-20"><a href="#Backup_and_restore"><span class="tocnumber">5.2</span> <span class="toctext">Backup and restore</span></a>
<ul>
<li class="toclevel-3 tocsection-21"><a href="#Backup_using_cryptsetup"><span class="tocnumber">5.2.1</span> <span class="toctext">Backup using cryptsetup</span></a></li>
<li class="toclevel-3 tocsection-22"><a href="#Restore_using_cryptsetup"><span class="tocnumber">5.2.2</span> <span class="toctext">Restore using cryptsetup</span></a></li>
<li class="toclevel-3 tocsection-23"><a href="#Manual_backup_and_restore"><span class="tocnumber">5.2.3</span> <span class="toctext">Manual backup and restore</span></a></li>
</ul>
</li>
<li class="toclevel-2 tocsection-24"><a href="#Re-encrypting_devices"><span class="tocnumber">5.3</span> <span class="toctext">Re-encrypting devices</span></a>
<ul>
<li class="toclevel-3 tocsection-25"><a href="#Encrypt_an_existing_unencrypted_file_system"><span class="tocnumber">5.3.1</span> <span class="toctext">Encrypt an existing unencrypted file system</span></a></li>
<li class="toclevel-3 tocsection-26"><a href="#Re-encrypting_an_existing_LUKS_partition"><span class="tocnumber">5.3.2</span> <span class="toctext">Re-encrypting an existing LUKS partition</span></a></li>
</ul>
</li>
<li class="toclevel-2 tocsection-27"><a href="#Conversion_from_LUKS1_to_LUKS2_and_back"><span class="tocnumber">5.4</span> <span class="toctext">Conversion from LUKS1 to LUKS2 and back</span></a></li>
</ul>
</li>
<li class="toclevel-1 tocsection-28"><a href="#Resizing_encrypted_devices"><span class="tocnumber">6</span> <span class="toctext">Resizing encrypted devices</span></a>
<ul>
<li class="toclevel-2 tocsection-29"><a href="#Loopback_file_system"><span class="tocnumber">6.1</span> <span class="toctext">Loopback file system</span></a></li>
<li class="toclevel-2 tocsection-30"><a href="#Integrity_protected_device"><span class="tocnumber">6.2</span> <span class="toctext">Integrity protected device</span></a></li>
</ul>
</li>
<li class="toclevel-1 tocsection-31"><a href="#Keyfiles"><span class="tocnumber">7</span> <span class="toctext">Keyfiles</span></a>
<ul>
<li class="toclevel-2 tocsection-32"><a href="#Types_of_keyfiles"><span class="tocnumber">7.1</span> <span class="toctext">Types of keyfiles</span></a>
<ul>
<li class="toclevel-3 tocsection-33"><a href="#passphrase"><span class="tocnumber">7.1.1</span> <span class="toctext">passphrase</span></a></li>
<li class="toclevel-3 tocsection-34"><a href="#randomtext"><span class="tocnumber">7.1.2</span> <span class="toctext">randomtext</span></a></li>
<li class="toclevel-3 tocsection-35"><a href="#binary"><span class="tocnumber">7.1.3</span> <span class="toctext">binary</span></a></li>
</ul>
</li>
<li class="toclevel-2 tocsection-36"><a href="#Creating_a_keyfile_with_random_characters"><span class="tocnumber">7.2</span> <span class="toctext">Creating a keyfile with random characters</span></a>
<ul>
<li class="toclevel-3 tocsection-37"><a href="#Storing_the_keyfile_on_a_file_system"><span class="tocnumber">7.2.1</span> <span class="toctext">Storing the keyfile on a file system</span></a>
<ul>
<li class="toclevel-4 tocsection-38"><a href="#Securely_overwriting_stored_keyfiles"><span class="tocnumber">7.2.1.1</span> <span class="toctext">Securely overwriting stored keyfiles</span></a></li>
</ul>
</li>
<li class="toclevel-3 tocsection-39"><a href="#Storing_the_keyfile_in_ramfs"><span class="tocnumber">7.2.2</span> <span class="toctext">Storing the keyfile in ramfs</span></a></li>
</ul>
</li>
<li class="toclevel-2 tocsection-40"><a href="#Configuring_LUKS_to_make_use_of_the_keyfile"><span class="tocnumber">7.3</span> <span class="toctext">Configuring LUKS to make use of the keyfile</span></a></li>
<li class="toclevel-2 tocsection-41"><a href="#Manually_unlocking_a_partition_using_a_keyfile"><span class="tocnumber">7.4</span> <span class="toctext">Manually unlocking a partition using a keyfile</span></a></li>
<li class="toclevel-2 tocsection-42"><a href="#Unlocking_the_root_partition_at_boot"><span class="tocnumber">7.5</span> <span class="toctext">Unlocking the root partition at boot</span></a>
<ul>
<li class="toclevel-3 tocsection-43"><a href="#With_a_keyfile_stored_on_an_external_media"><span class="tocnumber">7.5.1</span> <span class="toctext">With a keyfile stored on an external media</span></a>
<ul>
<li class="toclevel-4 tocsection-44"><a href="#Configuring_mkinitcpio"><span class="tocnumber">7.5.1.1</span> <span class="toctext">Configuring mkinitcpio</span></a></li>
<li class="toclevel-4 tocsection-45"><a href="#Configuring_the_kernel_parameters"><span class="tocnumber">7.5.1.2</span> <span class="toctext">Configuring the kernel parameters</span></a></li>
</ul>
</li>
<li class="toclevel-3 tocsection-46"><a href="#With_a_keyfile_embedded_in_the_initramfs"><span class="tocnumber">7.5.2</span> <span class="toctext">With a keyfile embedded in the initramfs</span></a></li>
</ul>
</li>
</ul>
</li>
</ul>
</div>

<h2><span class="mw-headline" id="Preparation">Preparation</span></h2>
<p>Before using <span class="plainlinks archwiki-template-pkg"><a rel="nofollow" class="external text" href="https://archlinux.org/packages/?name=cryptsetup">cryptsetup</a></span>, always make sure the <code>dm_crypt</code> <a href="/title/Kernel_module" title="Kernel module">kernel module</a> is loaded.
</p>
<h2><span class="mw-headline" id="Cryptsetup_usage">Cryptsetup usage</span></h2>
<p><i>Cryptsetup</i> is the command line tool to interface with <i>dm-crypt</i> for creating, accessing and managing encrypted devices. The tool was later expanded to support different encryption types that rely on the Linux kernel <b>d</b>evice-<b>m</b>apper and the <b>crypt</b>ographic modules. The most notable expansion was for the Linux Unified Key Setup (LUKS) extension, which stores all of the needed setup information for dm-crypt on the disk itself and abstracts partition and key management in an attempt to improve ease of use. Devices accessed via the device-mapper are called block devices. For further information see <a href="/title/Data-at-rest_encryption#Block_device_encryption" title="Data-at-rest encryption">Data-at-rest encryption#Block device encryption</a>. 
</p><p>The tool is used as follows: 
</p>
<pre># cryptsetup <i>OPTIONS</i> <i>action</i> <i>action-specific-options</i> <i>device</i> <i>dmname</i>
</pre>
<p>It has compiled-in defaults for the options and the encryption mode, which will be used if no others are specified on the command line. Have a look at 
</p>
<pre>$ cryptsetup --help 
</pre>
<p>which lists options, actions and the default parameters for the encryption modes in that order. A full list of options can be found on the man page.
Since different parameters are required or optional, depending on encryption mode and action, the following sections point out differences further. Block device encryption is fast, but speed matters a lot too. Since changing an encryption cipher of a block device after setup is difficult, it is important to check <i>dm-crypt</i> performance for the individual parameters in advance: 
</p>
<pre>$ cryptsetup benchmark 
</pre>
<p>can give guidance on deciding for an algorithm and key-size prior to installation. If certain AES ciphers excel with a considerable higher throughput, these are probably the ones with hardware support in the CPU.
</p>
<div class="archwiki-template-box archwiki-template-box-tip"><strong>Tip:</strong> You may want to practise encrypting a virtual hard drive in a <a href="/title/Virtual_machine" class="mw-redirect" title="Virtual machine">virtual machine</a> when learning.</div>
<h3><span class="mw-headline" id="Cryptsetup_passphrases_and_keys">Cryptsetup passphrases and keys</span></h3>
<p>An encrypted block device is protected by a key. A key is either: 
</p>
<ul><li>a passphrase: see <a href="/title/Security#Passwords" title="Security">Security#Passwords</a>.</li>
<li>a keyfile, see <a href="#Keyfiles">#Keyfiles</a>.</li></ul>
<p>Both key types have default maximum sizes: passphrases can be up to 512 characters and keyfiles up to 8192 KiB. 
</p><p>An important distinction of <i>LUKS</i> to note at this point is that the key is used to unlock the master-key of a LUKS-encrypted device and can be changed with root access. Other encryption modes do not support changing the key after setup, because they do not employ a master-key for the encryption. See <a href="/title/Data-at-rest_encryption#Block_device_encryption" title="Data-at-rest encryption">Data-at-rest encryption#Block device encryption</a> for details.
</p>
<h2><span class="mw-headline" id="Encryption_options_with_dm-crypt">Encryption options with dm-crypt</span></h2>
<p><i>Cryptsetup</i> supports different encryption operating modes to use with <i>dm-crypt</i>: 
</p>
<ul><li><code>--type luks</code> for using the default LUKS format version (LUKS1 with <span class="plainlinks archwiki-template-pkg"><a rel="nofollow" class="external text" href="https://archlinux.org/packages/?name=cryptsetup">cryptsetup</a></span> &lt; 2.1.0, LUKS2 with <span class="plainlinks archwiki-template-pkg"><a rel="nofollow" class="external text" href="https://archlinux.org/packages/?name=cryptsetup">cryptsetup</a></span> ≥ 2.1.0),</li>
<li><code>--type luks1</code> for using LUKS1, the most common version of LUKS,</li>
<li><code>--type luks2</code> for using LUKS2, the latest available version of LUKS that allows additional extensions,</li>
<li><code>--type plain</code> for using dm-crypt plain mode,</li>
<li><code>--type loopaes</code> for a loopaes legacy mode,</li>
<li><code>--type tcrypt</code> for a <a href="/title/TrueCrypt" class="mw-redirect" title="TrueCrypt">TrueCrypt</a> compatibility mode.</li>
<li><code>--type bitlk</code> for a <a href="https://en.wikipedia.org/wiki/BitLocker" class="extiw" title="wikipedia:BitLocker">BitLocker</a> compatibility mode. See <span class="plainlinks archwiki-template-man" title="$ man 8 cryptsetup"><a rel="nofollow" class="external text" href="https://man.archlinux.org/man/cryptsetup.8#BITLK_(Windows_BitLocker-compatible)_EXTENSION_(EXPERIMENTAL)">cryptsetup(8)&#32;§&#8239;BITLK (Windows BitLocker-compatible) EXTENSION (EXPERIMENTAL)</a></span>.</li></ul>
<p>The basic cryptographic options for encryption cipher and hashes available can be used for all modes and rely on the kernel cryptographic backend features. All that are loaded and available to use as options at runtime can be viewed with:
</p>
<pre>$ less /proc/crypto 
</pre>
<div class="archwiki-template-box archwiki-template-box-tip"><strong>Tip:</strong> If the list is short, execute <code>$ cryptsetup benchmark</code> which will trigger loading available modules.</div>
<p>The following introduces encryption options for the <code>luks</code>, <code>luks1</code>, <code>luks2</code> and <code>plain</code> modes. Note that the tables list options used in the respective examples in this article and not all available ones.
</p>
<h3><span class="mw-headline" id="Encryption_options_for_LUKS_mode">Encryption options for LUKS mode</span></h3>
<p>The <i>cryptsetup</i> action to set up a new dm-crypt device in LUKS encryption mode is <code>luksFormat</code>. Unlike what the name implies, it does not format the device, but sets up the LUKS device header and encrypts the master-key with the desired cryptographic options. 
</p><p>In order to create a new LUKS container with the compiled-in defaults listed by <code>cryptsetup --help</code>, simply execute:
</p>
<pre># cryptsetup luksFormat <i>device</i>
</pre>
<p>As of cryptsetup 2.4.0, this is equivalent to:  
</p>
<pre># cryptsetup --type luks2 --cipher aes-xts-plain64 --hash sha256 --iter-time 2000 --key-size 256 --pbkdf argon2id --use-urandom --verify-passphrase luksFormat <i>device</i>
</pre>
<p>Defaults are compared with a cryptographically higher specification example in the table below, with accompanying comments: 
</p>
<table class="wikitable">
<tbody><tr>
<th>Options</th>
<th>Cryptsetup 2.1.0 defaults</th>
<th>Example</th>
<th>Comment
</th></tr>
<tr>
<th style="text-align:right;white-space:nowrap;">--cipher
<p>-c
</p>
</th>
<td><code>aes-xts-plain64</code>
</td>
<td><code>aes-xts-plain64</code>
</td>
<td><a rel="nofollow" class="external text" href="https://www.kernel.org/pub/linux/utils/cryptsetup/v1.6/v1.6.0-ReleaseNotes">Release 1.6.0</a> changed the defaults to an AES <a href="/title/Data-at-rest_encryption#Ciphers_and_modes_of_operation" title="Data-at-rest encryption">cipher</a> in <a href="https://en.wikipedia.org/wiki/Disk_encryption_theory#XEX-based_tweaked-codebook_mode_with_ciphertext_stealing_.28XTS.29" class="extiw" title="wikipedia:Disk encryption theory">XTS</a> mode (see item 5.16 <a rel="nofollow" class="external text" href="https://gitlab.com/cryptsetup/cryptsetup/wikis/FrequentlyAskedQuestions#5-security-aspects">of the FAQ</a>). It is advised against using the previous default <code>--cipher aes-cbc-essiv</code> because of its known <a href="https://en.wikipedia.org/wiki/Disk_encryption_theory#Cipher-block_chaining_.28CBC.29" class="extiw" title="wikipedia:Disk encryption theory">issues</a> and practical <a rel="nofollow" class="external text" href="https://www.jakoblell.com/blog/2013/12/22/practical-malleability-attack-against-cbc-encrypted-luks-partitions/">attacks</a> against them.
</td></tr>
<tr>
<th style="text-align:right;white-space:nowrap;">--key-size
<p>-s
</p>
</th>
<td><code>256</code> (<code>512</code> for XTS)
</td>
<td><code>512</code>
</td>
<td>By default a 512 bit key-size is used for XTS ciphers. Note however that <a href="https://en.wikipedia.org/wiki/Disk_encryption_theory#XEX-based_tweaked-codebook_mode_with_ciphertext_stealing_.28XTS.29" class="extiw" title="wikipedia:Disk encryption theory">XTS splits the supplied key in half</a>, so this results in AES-256 being used.
</td></tr>
<tr>
<th style="text-align:right;white-space:nowrap;">--hash
<p>-h
</p>
</th>
<td><code>sha256</code>
</td>
<td><code>sha512</code>
</td>
<td>Hash algorithm used for <a href="/title/Data-at-rest_encryption#Cryptographic_metadata" title="Data-at-rest encryption">key derivation</a>. Release 1.7.0 changed defaults from <code>sha1</code> to <code>sha256</code> "<i>not for security reasons [but] mainly to prevent compatibility problems on hardened systems where SHA1 is already [being] phased out</i>"<a rel="nofollow" class="external autonumber" href="https://www.kernel.org/pub/linux/utils/cryptsetup/v1.7/v1.7.0-ReleaseNotes">[1]</a>. The former default of <code>sha1</code> can still be used for compatibility with older versions of <i>cryptsetup</i> since it is <a rel="nofollow" class="external text" href="https://gitlab.com/cryptsetup/cryptsetup/wikis/FrequentlyAskedQuestions#5-security-aspects">considered secure</a> (see item 5.20).
</td></tr>
<tr>
<th style="text-align:right;white-space:nowrap;">--iter-time
<p>-i
</p>
</th>
<td><code>2000</code>
</td>
<td><code>5000</code>
</td>
<td>Number of milliseconds to spend with PBKDF2 passphrase processing. Release 1.7.0 changed defaults from <code>1000</code> to <code>2000</code> to "<i>try to keep PBKDF2 iteration count still high enough and also still acceptable for users.</i>"<a rel="nofollow" class="external autonumber" href="https://www.kernel.org/pub/linux/utils/cryptsetup/v1.7/v1.7.0-ReleaseNotes">[2]</a>. This option is only relevant for LUKS operations that set or change passphrases, such as <code>luksFormat</code> or <code>luksAddKey</code>. Specifying 0 as parameter selects the compiled-in default..
</td></tr>
<tr>
<th style="text-align:right;white-space:nowrap;">--use-urandom
</th>
<td><code>--use-urandom</code>
</td>
<td><code>--use-random</code>
</td>
<td>Selects which <a href="/title/Random_number_generator" class="mw-redirect" title="Random number generator">random number generator</a> to use. Note that <a rel="nofollow" class="external text" href="https://lwn.net/Articles/808575/">/dev/random blocking pool has been removed</a>. Therefore, <code>--use-random</code> flag is now equivalent to <code>--use-urandom</code>.
</td></tr>
<tr>
<th style="text-align:right;white-space:nowrap;">--verify-passphrase
<p>-y
</p>
</th>
<td>Yes
</td>
<td>-
</td>
<td>Enabled by default in Arch Linux for <code>luksFormat</code> and <code>luksAddKey</code>.
</td></tr></tbody></table>
<p>The properties of LUKS features and options are described in the <a rel="nofollow" class="external text" href="https://gitlab.com/cryptsetup/cryptsetup/wikis/Specification">LUKS1</a> (pdf) and <a rel="nofollow" class="external text" href="https://gitlab.com/cryptsetup/cryptsetup/blob/master/docs/on-disk-format-luks2.pdf">LUKS2</a> (pdf) specifications.
</p>
<div class="archwiki-template-box archwiki-template-box-tip"><strong>Tip:</strong> The project developers' <a rel="nofollow" class="external text" href="https://mbroz.fedorapeople.org/talks/DevConf2016/devconf2016-luks2.pdf">devconfcz2016</a> (pdf) presentation summarizes the motivation for the major specification update to LUKS2.</div>
<h4><span class="mw-headline" id="Iteration_time">Iteration time</span></h4>
<p>From <a rel="nofollow" class="external text" href="https://gitlab.com/cryptsetup/cryptsetup/-/wikis/FrequentlyAskedQuestions#2-setup">cryptsetup FAQ§2.1</a> and <a rel="nofollow" class="external text" href="https://gitlab.com/cryptsetup/cryptsetup/-/wikis/FrequentlyAskedQuestions#3-common-problems">§3.4</a>:
</p>
<dl><dd>The unlock time for a key-slot [...] is calculated when setting a passphrase. By default it is 1 second (2 seconds for LUKS2). [...]</dd>
<dd>Passphrase iteration count is based on time and hence security level depends on CPU power of the system the LUKS container is created on. [...]</dd>
<dd>If you set a passphrase on a fast machine and then unlock it on a slow machine, the unlocking time can be much longer.</dd></dl>
<p>As such, it is better to always create a container on the machine where it will be most often accessed.
</p><p>Read the rest of those sections for advice on how to correctly adjust the iteration count should the need arise.
</p>
<h4><span class="mw-headline" id="Sector_size">Sector size</span></h4>
<p>See <a href="/title/Advanced_Format#dm-crypt" title="Advanced Format">Advanced Format#dm-crypt</a>.
</p>
<h3><span class="mw-headline" id="Encryption_options_for_plain_mode">Encryption options for plain mode</span></h3>
<p>In dm-crypt <i>plain</i> mode, there is no master-key on the device, hence, there is no need to set it up. Instead the encryption options to be employed are used directly to create the mapping between an encrypted disk and a named device. The mapping can be created against a partition or a full device. In the latter case not even a partition table is needed.  
</p><p>To create a <i>plain</i> mode mapping with cryptsetup's default parameters: 
</p>
<pre># cryptsetup <i>options</i> open --type plain <i>device</i> <i>dmname</i>
</pre>
<p>Executing it will prompt for a password, which should have very high entropy. Below a comparison of default parameters with the example in <a href="/title/Dm-crypt/Encrypting_an_entire_system#Plain_dm-crypt" title="Dm-crypt/Encrypting an entire system">dm-crypt/Encrypting an entire system#Plain dm-crypt</a>.
</p>
<table class="wikitable">
<tbody><tr>
<th>Option</th>
<th>Cryptsetup 2.1.0 defaults</th>
<th>Example</th>
<th>Comment
</th></tr>
<tr>
<th style="text-align:right;white-space:nowrap;">--hash
<p>-h
</p>
</th>
<td><code>ripemd160</code>
</td>
<td>-
</td>
<td>The hash is used to create the key from the passphrase; it is not used on a keyfile.
</td></tr>
<tr>
<th style="text-align:right;white-space:nowrap;">--cipher
<p>-c
</p>
</th>
<td><code>aes-cbc-essiv:sha256</code>
</td>
<td><code>aes-xts-plain64</code>
</td>
<td>The cipher consists of three parts: cipher-chainmode-IV generator. Please see <a href="/title/Data-at-rest_encryption#Ciphers_and_modes_of_operation" title="Data-at-rest encryption">Data-at-rest encryption#Ciphers and modes of operation</a> for an explanation of these settings, and the <a rel="nofollow" class="external text" href="https://gitlab.com/cryptsetup/cryptsetup/wikis/DMCrypt">DMCrypt documentation</a> for some of the options available.
</td></tr>
<tr>
<th style="text-align:right;white-space:nowrap;">--key-size
<p>-s
</p>
</th>
<td><code>256</code>
</td>
<td><code>512</code>
</td>
<td>The key size (in bits). The size will depend on the cipher being used and also the chainmode in use. Xts mode requires twice the key size of cbc.
</td></tr>
<tr>
<th style="text-align:right;white-space:nowrap;">--size
<p>-b
</p>
</th>
<td>real size of target disk
</td>
<td><code>2048</code> (mapped device will be 512B×2048=1MiB)
</td>
<td>Limit the maximum size of the device (in 512-byte sectors).
</td></tr>
<tr>
<th style="text-align:right;white-space:nowrap;">--offset
<p>-o
</p>
</th>
<td><code>0</code>
</td>
<td><code>0</code>
</td>
<td>The offset from the beginning of the target disk (in 512-byte sectors) from which to start the mapping.
</td></tr>
<tr>
<th style="text-align:right;white-space:nowrap;">--skip
<p>-p
</p>
</th>
<td><code>0</code>
</td>
<td><code>2048</code> (512B×2048=1MiB will be skipped)
</td>
<td>The number of 512-byte sectors of encrypted data to skip at the beginning.
</td></tr>
<tr>
<th style="text-align:right;white-space:nowrap;">--key-file
<p>-d
</p>
</th>
<td>default uses a passphrase
</td>
<td><code>/dev/sd<i>Z</i></code> (or e.g. <code>/boot/keyfile.enc</code>)
</td>
<td>The device or file to be used as a key. See <a href="#Keyfiles">#Keyfiles</a> for further details.
</td></tr>
<tr>
<th style="text-align:right;white-space:nowrap;">--keyfile-offset
</th>
<td><code>0</code>
</td>
<td><code>0</code>
</td>
<td>Offset from the beginning of the file where the key starts (in bytes). This option is supported from <i>cryptsetup</i> 1.6.7 onwards.
</td></tr>
<tr>
<th style="text-align:right;white-space:nowrap;">--keyfile-size
<p>-l
</p>
</th>
<td><code>8192kB</code>
</td>
<td>- (default applies)
</td>
<td>Limits the bytes read from the key file. This option is supported from <i>cryptsetup</i> 1.6.7 onwards.
</td></tr></tbody></table>
<p>Using the device <code>/dev/sd<i>X</i></code>, the above right column example results in:
</p>
<pre># cryptsetup --cipher=aes-xts-plain64 --offset=0 --key-file=/dev/sd<i>Z</i> --key-size=512 open --type=plain /dev/sdX enc
</pre>
<p>Unlike encrypting with LUKS, the above command must be executed <i>in full</i> whenever the mapping needs to be re-established, so it is important to remember the cipher, hash and key file details. We can now check that the mapping has been made:
</p>
<pre># fdisk -l
</pre>
<p>An entry should now exist for <code>/dev/mapper/enc</code>.
</p>
<h2><span class="mw-headline" id="Encrypting_devices_with_cryptsetup">Encrypting devices with cryptsetup</span></h2>
<p>This section shows how to employ the options for creating new encrypted block devices and accessing them manually. 
</p>
<div class="archwiki-template-box archwiki-template-box-warning"><strong>Warning:</strong> GRUB's support for LUKS2 is limited; see <a href="/title/GRUB#Encrypted_/boot" title="GRUB">GRUB#Encrypted /boot</a> for details. Use LUKS1 (<code>cryptsetup luksFormat --type luks1</code>) for partitions that GRUB will need to unlock.</div>
<h3><span class="mw-headline" id="Encrypting_devices_with_LUKS_mode">Encrypting devices with LUKS mode</span></h3>
<h4><span class="mw-headline" id="Formatting_LUKS_partitions">Formatting LUKS partitions</span></h4>
<p>In order to setup a partition as an encrypted LUKS partition execute:
</p>
<pre># cryptsetup luksFormat <i>device</i>
</pre>
<p>You will then be prompted to enter a password and verify it.
</p><p>See <a href="#Encryption_options_for_LUKS_mode">#Encryption options for LUKS mode</a> for command line options.
</p><p>You can check the results with:
</p>
<pre># cryptsetup luksDump <i>device</i>
</pre>
<p>You will note that the dump not only shows the cipher header information, but also the key-slots in use for the LUKS partition.  
</p><p>The following example will create an encrypted root partition on <code>/dev/sda1</code> using the default AES cipher in XTS mode with an effective 256-bit encryption 
</p>
<pre># cryptsetup -s 512 luksFormat /dev/sda1
</pre>
<h5><span class="mw-headline" id="Using_LUKS_to_format_partitions_with_a_keyfile">Using LUKS to format partitions with a keyfile</span></h5>
<p>When creating a new LUKS encrypted partition, a keyfile may be associated with the partition on its creation using:
</p>
<pre># cryptsetup luksFormat <i>device</i> <i>/path/to/mykeyfile</i>
</pre>
<p>See <a href="#Keyfiles">#Keyfiles</a> for instructions on how to generate and manage keyfiles.
</p>
<h4><span id="Unlocking.2FMapping_LUKS_partitions_with_the_device_mapper"></span><span class="mw-headline" id="Unlocking/Mapping_LUKS_partitions_with_the_device_mapper">Unlocking/Mapping LUKS partitions with the device mapper</span></h4>
<p>Once the LUKS partitions have been created, they can then be unlocked.
</p><p>The unlocking process will map the partitions to a new device name using the device mapper. This alerts the kernel that <code><i>device</i></code> is actually an encrypted device and should be addressed through LUKS using the <code>/dev/mapper/<i>dm_name</i></code> so as not to overwrite the encrypted data. To guard against accidental overwriting, read about the possibilities to <a href="#Backup_and_restore">backup the cryptheader</a> after finishing setup.
</p><p>In order to open an encrypted LUKS partition execute:
</p>
<pre># cryptsetup open <i>device</i> <i>dm_name</i>
</pre>
<p>You will then be prompted for the password to unlock the partition. Usually the device mapped name is descriptive of the function of the partition that is mapped. For example the following unlocks a root luks partition <code>/dev/sda1</code> and maps it to device mapper named <code>root</code>:
</p>
<pre># cryptsetup open /dev/sda1 root 
</pre>
<p>Once opened, the root partition device address would be <code>/dev/mapper/root</code> instead of the partition (e.g. <code>/dev/sda1</code>). 
</p><p>For setting up LVM ontop the encryption layer the device file for the decrypted volume group would be anything like <code>/dev/mapper/root</code> instead of <code>/dev/sda1</code>. LVM will then give additional names to all logical volumes created, e.g. <code>/dev/lvmpool/root</code> and <code>/dev/lvmpool/swap</code>.
</p><p>In order to write encrypted data into the partition it must be accessed through the device mapped name. The first step of access will typically be to <a href="/title/Create_a_file_system" class="mw-redirect" title="Create a file system">create a file system</a>. For example:
</p>
<pre># mkfs -t ext4 /dev/mapper/root
</pre>
<p>The device <code>/dev/mapper/root</code> can then be <a href="/title/Mount" class="mw-redirect" title="Mount">mounted</a> like any other partition.
</p><p>To close the LUKS container, unmount the partition and do:
</p>
<pre># cryptsetup close root
</pre>
<h4><span class="mw-headline" id="Using_a_TPM_to_store_keys">Using a TPM to store keys</span></h4>
<p>See <a href="/title/Trusted_Platform_Module#Data-at-rest_encryption_with_LUKS" title="Trusted Platform Module">Trusted Platform Module#Data-at-rest encryption with LUKS</a>.
</p>
<h3><span class="mw-headline" id="Encrypting_devices_with_plain_mode">Encrypting devices with plain mode</span></h3>
<p>The creation and subsequent access of a <i>dm-crypt</i> plain mode encryption both require not more than using the <i>cryptsetup</i> <code>open</code> action with correct <a href="#Encryption_options_for_plain_mode">parameters</a>. The following shows that with two examples of non-root devices, but adds a quirk by stacking both (i.e. the second is created inside the first). Obviously, stacking the encryption doubles overhead. The usecase here is simply to illustrate another example of the cipher option usage. 
</p><p>A first mapper is created with <i>cryptsetup's</i> plain-mode defaults, as described in the table's left column above  
</p>
<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;"># cryptsetup --type plain -v open /dev/sdaX plain1</pre>
<pre style="margin-top: 0; border-top-style:dashed; padding-top: 0.8em;">Enter passphrase: 
Command successful.
</pre>
<p>Now we add the second block device inside it, using different encryption parameters and with an (optional) offset, create a file system and mount it  
</p>
<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;"># cryptsetup --type plain --cipher=serpent-xts-plain64 --hash=sha256 --key-size=256 --offset=10  open /dev/mapper/plain1 plain2</pre>
<pre style="margin-top: 0; border-top-style:dashed; padding-top: 0.8em;">Enter passphrase:</pre>
<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;"># lsblk -p</pre>
<pre style="margin-top: 0; border-top-style:dashed; padding-top: 0.8em;"> NAME                                                     
 /dev/sda                                     
 ├─/dev/sdaX          
 │ └─/dev/mapper/plain1     
 │   └─/dev/mapper/plain2              
 ...
</pre>
<pre># mkfs -t ext2 /dev/mapper/plain2
# mount -t ext2 /dev/mapper/plain2 /mnt
# echo "This is stacked. one passphrase per foot to shoot." &gt; /mnt/stacked.txt
</pre>
<p>We close the stack to check access works
</p>
<pre># cryptsetup close plain2
# cryptsetup close plain1
</pre>
<p>First, let us try to open the file system directly: 
</p>
<pre># cryptsetup --type plain --cipher=serpent-xts-plain64 --hash=sha256 --key-size=256 --offset=10 open /dev/sdaX plain2
</pre>
<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;"># mount -t ext2 /dev/mapper/plain2 /mnt</pre>
<pre style="margin-top: 0; border-top-style:dashed; padding-top: 0.8em;">mount: wrong fs type, bad option, bad superblock on /dev/mapper/plain2,
      missing codepage or helper program, or other error
</pre>
<p>Why that did not work? Because the "plain2" starting block (<code>10</code>) is still encrypted with the cipher from "plain1". It can only be accessed via the stacked mapper. The error is arbitrary though, trying a wrong passphrase or wrong options will yield the same. For <i>dm-crypt</i> plain mode, the <code>open</code> action will not error out itself.  
</p><p>Trying again in correct order: 
</p>
<pre># cryptsetup close plain2    # dysfunctional mapper from previous try
</pre>
<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;"># cryptsetup --type plain open /dev/sdaX plain1</pre>
<pre style="margin-top: 0; border-top-style:dashed; padding-top: 0.8em;">Enter passphrase:
</pre>
<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;"># cryptsetup --type plain --cipher=serpent-xts-plain64 --hash=sha256 --key-size=256 --offset=10 open /dev/mapper/plain1 plain2</pre>
<pre style="margin-top: 0; border-top-style:dashed; padding-top: 0.8em;">Enter passphrase:</pre>
<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;"># mount /dev/mapper/plain2 /mnt &amp;&amp; cat /mnt/stacked.txt</pre>
<pre style="margin-top: 0; border-top-style:dashed; padding-top: 0.8em;">This is stacked. one passphrase per foot to shoot.
</pre>
<p><i>dm-crypt</i> will handle stacked encryption with some mixed modes too. For example LUKS mode could be stacked on the "plain1" mapper. Its header would then be encrypted inside "plain1" when that is closed.
</p><p>Available for plain mode only is the option <code>--shared</code>. With it a single device can be segmented into different non-overlapping mappers. We do that in the next example, using a <i>loopaes</i> compatible cipher mode for "plain2" this time: 
</p>
<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;"># cryptsetup --type plain --offset 0 --size 1000 open /dev/sdaX plain1</pre>
<pre style="margin-top: 0; border-top-style:dashed; padding-top: 0.8em;">Enter passphrase:</pre>
<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;"># cryptsetup --type plain --offset 1000 --size 1000 --shared --cipher=aes-cbc-lmk --hash=sha256 open /dev/sdaX plain2</pre>
<pre style="margin-top: 0; border-top-style:dashed; padding-top: 0.8em;">Enter passphrase:</pre>
<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;"># lsblk -p</pre>
<pre style="margin-top: 0; border-top-style:dashed; padding-top: 0.8em;">NAME                    
dev/sdaX                    
├─/dev/sdaX               
│ ├─/dev/mapper/plain1     
│ └─/dev/mapper/plain2     
...
</pre>
<p>As the device tree shows both reside on the same level, i.e. are not stacked and "plain2" can be opened individually.
</p>
<h2><span class="mw-headline" id="Cryptsetup_actions_specific_for_LUKS">Cryptsetup actions specific for LUKS</span></h2>
<h3><span class="mw-headline" id="Key_management">Key management</span></h3>
<p>It is possible to define addition keys for the LUKS partition. This enables the user to create access keys for safe backup storage  In so-called key escrow, one key is used for daily usage, another kept in escrow to gain access to the partition in case the daily passphrase is forgotten or a keyfile is lost/damaged.  A different key-slot could also be used to grant access to a partition to a user by issuing a second key and later revoking it again. 
</p><p>Once an encrypted partition has been created, the initial keyslot 0 is created (if no other was specified manually). Additional keyslots are numbered from 1 to 7. Which keyslots are used can be seen by issuing 
</p>
<pre># cryptsetup luksDump /dev/<i>device</i>
</pre>
<p>Where <code><i>device</i></code> is the block device containing the LUKS header. This and all the following commands in this section work on header backup files as well.
</p>
<h4><span class="mw-headline" id="Adding_LUKS_keys">Adding LUKS keys</span></h4>
<p>Adding new keyslots is accomplished using cryptsetup with the <code>luksAddKey</code> action. For safety it will always, i.e. also for already unlocked devices, ask for a valid existing key ("any passphrase") before a new one may be entered:
</p>
<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;"># cryptsetup luksAddKey /dev/<i>device</i> (<i>/path/to/</i>additionalkeyfile<i>)</i></pre>
<pre style="margin-top: 0; border-top-style:dashed; padding-top: 0.8em;">Enter any passphrase:
Enter new passphrase for key slot:
Verify passphrase: 
</pre>
<p>If <code><i>/path/to/additionalkeyfile</i></code> is given, cryptsetup will add a new keyslot for <code><i>additionalkeyfile</i></code>. Otherwise a new passphrase will be prompted for twice. For using an existing <i>keyfile</i> to authorize the action, the <code>--key-file</code> or <code>-d</code> option followed by the "old" <code><i>keyfile</i></code> will try to unlock all available keyfile keyslots:
</p>
<pre># cryptsetup luksAddKey /dev/<i>device</i> (<i>/path/to/additionalkeyfile</i>) -d <i>/path/to/keyfile</i>
</pre>
<p>If it is intended to use multiple keys and change or revoke them, the <code>--key-slot</code> or <code>-S</code> option may be used to specify the slot: 
</p>
<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;"># cryptsetup luksAddKey /dev/<i>device</i> -S 6</pre>
<pre style="margin-top: 0; border-top-style:dashed; padding-top: 0.8em;">Enter any passphrase: 
Enter new passphrase for key slot: 
Verify passphrase:
</pre>
<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;"># cryptsetup luksDump /dev/sda8 | grep 'Slot 6'</pre>
<pre style="margin-top: 0; border-top-style:dashed; padding-top: 0.8em;">Key Slot 6: ENABLED
</pre>
<p>To show an associated action in this example, we decide to change the key right away:  
</p>
<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;"># cryptsetup luksChangeKey /dev/<i>device</i> -S 6</pre>
<pre style="margin-top: 0; border-top-style:dashed; padding-top: 0.8em;">Enter LUKS passphrase to be changed: 
Enter new LUKS passphrase:
</pre>
<p>before continuing to remove it.
</p>
<h4><span class="mw-headline" id="Removing_LUKS_keys">Removing LUKS keys</span></h4>
<p>There are three different actions to remove keys from the header: 
</p>
<ul><li><code>luksRemoveKey</code> is used to remove a key by specifying its passphrase/key-file.</li>
<li><code>luksKillSlot</code> may be used to remove a key from a specific key slot (using another key). Obviously, this is extremely useful if you have forgotten a passphrase, lost a key-file, or have no access to it.</li>
<li><code>luksErase</code> is used to quickly remove <b>all</b> active keys.</li></ul>
<div class="archwiki-template-box archwiki-template-box-warning"><strong>Warning:</strong> 
<ul><li>All above actions can be used to irrevocably delete the last active key for an encrypted device!</li>
<li>The <code>luksErase</code> command was added in version 1.6.4 to quickly nuke access to the device. This action <b>will not</b> prompt for a valid passphrase! It will not <a href="/title/Dm-crypt/Drive_preparation#Wipe_LUKS_header" title="Dm-crypt/Drive preparation">wipe the LUKS header</a>, but all keyslots at once and you will, therefore, not be able to regain access unless you have a valid backup of the LUKS header.</li></ul>
</div>
<p>For above warning it is good to know the key we want to <b>keep</b> is valid. An easy check is to unlock the device with the <code>-v</code> option, which will specify which slot it occupies:  
</p>
<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;"># cryptsetup --test-passphrase -v open /dev/<i>device</i></pre>
<pre style="margin-top: 0; border-top-style:dashed; padding-top: 0.8em;">Enter passphrase for /dev/<i>device</i>: 
Key slot 1 unlocked.
Command successful.
</pre>
<p>Now we can remove the key added in the previous subsection using its passphrase: 
</p>
<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;"># cryptsetup luksRemoveKey /dev/<i>device</i></pre>
<pre style="margin-top: 0; border-top-style:dashed; padding-top: 0.8em;">Enter LUKS passphrase to be deleted:
</pre>
<p>If we had used the same passphrase for two keyslots, the first slot would be wiped now. Only executing it again would remove the second one. 
</p><p>Alternatively, we can specify the key slot: 
</p>
<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;"># cryptsetup luksKillSlot /dev/<i>device</i> 6</pre>
<pre style="margin-top: 0; border-top-style:dashed; padding-top: 0.8em;">Enter any remaining LUKS passphrase:
</pre>
<p>Note that in both cases, no confirmation was required.
</p>
<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;"># cryptsetup luksDump /dev/sda8 | grep 'Slot 6'</pre>
<pre style="margin-top: 0; border-top-style:dashed; padding-top: 0.8em;">Key Slot 6: DISABLED
</pre>
<p>To re-iterate the warning above: If the same passphrase had been used for key slots 1 and 6, both would be gone now.
</p>
<h3><span class="mw-headline" id="Backup_and_restore">Backup and restore</span></h3>
<p>If the header of a LUKS encrypted partition gets destroyed, you will not be able to decrypt your data. It is just as much of a dilemma as forgetting the passphrase or damaging a key-file used to unlock the partition. Damage may occur by your own fault while re-partitioning the disk later or by third-party programs misinterpreting the partition table. Therefore, having a backup of the header and storing it on another disk might be a good idea.
</p>
<div class="archwiki-template-box archwiki-template-box-note"><strong>Note:</strong> If one of the LUKS-encrypted  partitions' passphrases becomes compromised, you must revoke it on <i>every</i> copy of the cryptheader, even those you have backed up. Otherwise, a copy of the backed-up cryptheader that uses the compromised passphrase can be used to determine the master key which in turn can be used to decrypt the associated partition (even your actual partition, not only the backed-up version). On the other hand, if the master key gets compromised, you have to reencrypt your whole partition. See <a rel="nofollow" class="external text" href="https://gitlab.com/cryptsetup/cryptsetup/wikis/FrequentlyAskedQuestions#6-backup-and-data-recovery">LUKS FAQ</a> for further details.</div>
<h4><span class="mw-headline" id="Backup_using_cryptsetup">Backup using cryptsetup</span></h4>
<p>Cryptsetup's <code>luksHeaderBackup</code> action stores a binary backup of the LUKS header and keyslot area:
</p>
<pre># cryptsetup luksHeaderBackup /dev/<i>device</i> --header-backup-file <i>/mnt/backup/file.img</i>
</pre>
<p>where <code><i>device</i></code> is the partition containing the LUKS volume.
</p><p>You can also back up the plain text header into ramfs and encrypt it with e.g. <a href="/title/GPG" class="mw-redirect" title="GPG">GPG</a> before writing it to persistent storage:
</p>
<pre># mount --mkdir -t ramfs ramfs /root/<i>tmp</i>
# cryptsetup luksHeaderBackup /dev/<i>device</i> --header-backup-file /root/<i>tmp</i>/<i>file</i>.img
# gpg2 --recipient <i>User_ID</i> --encrypt /root/<i>tmp</i>/<i>file</i>.img 
# cp /root/<i>tmp</i>/<i>file</i>.img.gpg /mnt/<i>backup</i>/
# umount /root/<i>tmp</i>
</pre>
<div class="archwiki-template-box archwiki-template-box-warning"><strong>Warning:</strong> <a href="/title/Tmpfs" title="Tmpfs">tmpfs</a> can swap to the disk in low memory situations, so it is not recommended here.</div>
<h4><span class="mw-headline" id="Restore_using_cryptsetup">Restore using cryptsetup</span></h4>
<div class="archwiki-template-box archwiki-template-box-warning"><strong>Warning:</strong> Restoring the wrong header or restoring to an unencrypted partition will cause data loss! The action can not perform a check whether the header is actually the <i>correct</i> one for that particular device.</div> 
<p>In order to evade restoring a wrong header, you can ensure it does work by using it as a remote <code>--header</code> first: 
</p>
<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;"># cryptsetup -v --header /mnt/<i>backup</i>/<i>file</i>.img open /dev/<i>device</i> test</pre>
<pre style="margin-top: 0; border-top-style:dashed; padding-top: 0.8em;">Key slot 0 unlocked.
Command successful.
</pre>
<pre># mount /dev/mapper/test /mnt/test &amp;&amp; ls /mnt/test 
# umount /mnt/test 
# cryptsetup close test 
</pre>
<p>Now that the check succeeded, the restore may be performed: 
</p>
<pre># cryptsetup luksHeaderRestore /dev/<i>device</i> --header-backup-file ./mnt/<i>backup</i>/<i>file</i>.img
</pre>
<p>Now that all the keyslot areas are overwritten; only active keyslots from the backup file are available after issuing the command.
</p>
<h4><span class="mw-headline" id="Manual_backup_and_restore">Manual backup and restore</span></h4>
<p>The header always resides at the beginning of the device and a backup can be performed without access to <i>cryptsetup</i> as well. First you have to find out the payload offset of the crypted partition:
</p>
<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;"># cryptsetup luksDump /dev/<i>device</i> | grep "Payload offset"</pre>
<pre style="margin-top: 0; border-top-style:dashed; padding-top: 0.8em;">Payload offset:	4040
</pre>
<p>Second check the sector size of the drive
</p>
<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;"># fdisk -l /dev/<i>device</i> | grep "Sector size"</pre>
<pre style="margin-top: 0; border-top-style:dashed; padding-top: 0.8em;">Sector size (logical/physical): 512 bytes / 512 bytes
</pre>
<p>Now that you know the values, you can backup the header with a simple <a href="/title/Dd" title="Dd">dd</a> command:
</p>
<pre># dd if=/dev/<i>device</i> of=/path/to/<i>file</i>.img bs=512 count=4040
</pre>
<p>and store it safely.
</p><p>A restore can then be performed using the same values as when backing up:
</p>
<pre># dd if=./<i>file</i>.img of=/dev/<i>device</i> bs=512 count=4040
</pre>
<h3><span class="mw-headline" id="Re-encrypting_devices">Re-encrypting devices</span></h3>
<div class="noprint archwiki-template-message">
<p><a href="/title/File:Tango-view-fullscreen.png" class="image"><img alt="Tango-view-fullscreen.png" src="/images/3/38/Tango-view-fullscreen.png" decoding="async" width="48" height="48" /></a><b>This article or section needs expansion.</b><a href="/title/File:Tango-view-fullscreen.png" class="image"><img alt="Tango-view-fullscreen.png" src="/images/3/38/Tango-view-fullscreen.png" decoding="async" width="48" height="48" /></a></p>
<div><b>Reason:</b> cryptsetup 2.2 using LUKS2 (with a 16 MiB header) supports online encryption/decryption/reencryption.<a rel="nofollow" class="external autonumber" href="https://mirrors.edge.kernel.org/pub/linux/utils/cryptsetup/v2.2/v2.2.0-ReleaseNotes">[3]</a> (Discuss in <a rel="nofollow" class="external text" href="https://wiki.archlinux.org/title/Talk:Dm-crypt/Device_encryption">Talk:Dm-crypt/Device encryption</a>)</div>
</div>
<p>The <span class="plainlinks archwiki-template-pkg"><a rel="nofollow" class="external text" href="https://archlinux.org/packages/?name=cryptsetup">cryptsetup</a></span> package features two options for re-encryption.
</p>
<dl><dt>cryptsetup reencrypt</dt>
<dd>Argument to <code>cryptsetup</code> itself: Preferred method. Currently LUKS2 devices only. Actions can be performed online. Supports multiple parallel re-encryption jobs. Resilient to system failures. See <span class="plainlinks archwiki-template-man" title="$ man 8 cryptsetup"><a rel="nofollow" class="external text" href="https://man.archlinux.org/man/cryptsetup.8">cryptsetup(8)</a></span> for more information.</dd></dl>
<dl><dt>cryptsetup-reencrypt</dt>
<dd>Legacy tool, supports LUKS1 in addition to LUKS2. Actions can be performed on unmounted devices only. Single process at a time. Sensitive to system failures. See <span class="plainlinks archwiki-template-man" title="$ man 8 cryptsetup-reencrypt"><a rel="nofollow" class="external text" href="https://man.archlinux.org/man/cryptsetup-reencrypt.8">cryptsetup-reencrypt(8)</a></span> for more information.</dd></dl>
<p>Both can be used to convert an existing unencrypted file system to a LUKS encrypted one or permanently remove LUKS encryption from a device (using <code>--decrypt</code>). As its name suggests it can also be used to re-encrypt an existing LUKS encrypted device, though, re-encryption is not possible for a detached LUKS header or other encryption modes (e.g. plain-mode). For re-encryption it is possible to change the <a href="#Encryption_options_for_LUKS_mode">#Encryption options for LUKS mode</a>. 
</p><p>One application of re-encryption may be to secure the data again after a passphrase or <a href="#Keyfiles">keyfile</a> has been compromised <i>and</i> one cannot be certain that no copy of the LUKS header has been obtained. For example, if only a passphrase has been shoulder-surfed but no physical/logical access to the device happened, it would be enough to change the respective passphrase/key only (<a href="#Key_management">#Key management</a>). 
</p>
<div class="archwiki-template-box archwiki-template-box-warning"><strong>Warning:</strong> Always make sure a <b>reliable backup</b> is available and double-check options you specify before using the tool!</div>
<p>The following shows an example to encrypt an unencrypted file system partition and a re-encryption of an existing LUKS device.
</p>
<h4><span class="mw-headline" id="Encrypt_an_existing_unencrypted_file_system">Encrypt an existing unencrypted file system</span></h4>
<div class="archwiki-template-box archwiki-template-box-tip"><strong>Tip:</strong> If you are trying to encrypt an existing root partition, you might want to create a separate and unencrypted boot partition which will be mounted to <code>/boot</code> (see <a href="/title/Dm-crypt/Encrypting_an_entire_system#Preparing_the_boot_partition" title="Dm-crypt/Encrypting an entire system">Dm-crypt/Encrypting an entire system#Preparing the boot partition</a>). It is not strictly necessary but has a number of advantages:
<ul><li>If <code>/boot</code> is located inside an encrypted root partition, the system will ask for the passphrase twice when the machine is powered on. The first time will happen when the boot loader attempts to read the files located inside encrypted <code>/boot</code>, the second time will be when the kernel tries to mount the encrypted partition <a rel="nofollow" class="external autonumber" href="https://opencraft.com/blog/tutorial-encrypting-an-existing-root-partition-in-ubuntu-with-dm-crypt-and-luks/">[4]</a>. This might not be the desired behaviour and can be prevented by having a separate and unencryted boot partition.</li>
<li>Some system restore applications (e.g., <span class="plainlinks archwiki-template-pkg"><a rel="nofollow" class="external text" href="https://aur.archlinux.org/packages/timeshift/">timeshift</a></span><sup><small>AUR</small></sup>) will not work if <code>/boot</code> is located inside an encryted partition <a rel="nofollow" class="external autonumber" href="https://github.com/teejee2008/timeshift/issues/280">[5]</a>.</li></ul>
In short, create a partition with the size of at least 260 MiB if needed. See <a href="/title/Partitioning#/boot" title="Partitioning">Partitioning#/boot</a>.</div>
<p>A LUKS encryption header is always stored at the beginning of the device. Since an existing file system will usually be allocated all partition sectors, the first step is to shrink it to make space for the LUKS header.
</p>
<div class="noprint archwiki-template-message">
<p><a href="/title/File:Tango-view-fullscreen.png" class="image"><img alt="Tango-view-fullscreen.png" src="/images/3/38/Tango-view-fullscreen.png" decoding="async" width="48" height="48" /></a><b>This article or section needs expansion.</b><a href="/title/File:Tango-view-fullscreen.png" class="image"><img alt="Tango-view-fullscreen.png" src="/images/3/38/Tango-view-fullscreen.png" decoding="async" width="48" height="48" /></a></p>
<div><b>Reason:</b> cryptsetup man pages suggest using twice the LUKS2 header size. That implies 32 MiB and using <code>--reduce-device-size 32M</code> (Discuss in <a rel="nofollow" class="external text" href="https://wiki.archlinux.org/title/Talk:Dm-crypt/Device_encryption">Talk:Dm-crypt/Device encryption</a>)</div>
</div>
<p>The <a href="#Encryption_options_for_LUKS_mode">default</a> LUKS2 header requires 16 MiB. If the current file system occupies all the available space, we will have to shrink it at least that much. To shrink an existing <code>ext4</code> file system on <code>/dev/sdaX</code> to its current possible minimum:
</p>
<pre># umount /mnt
</pre>
<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;"># e2fsck -f /dev/sdaX</pre>
<pre style="margin-top: 0; border-top-style:dashed; padding-top: 0.8em;">e2fsck 1.43-WIP (18-May-2015)
Pass 1: Checking inodes, blocks, and sizes
...
/dev/sda6: 12/166320 files (0.0% non-contiguous), 28783/665062 blocks
</pre>
<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;"># resize2fs -p -M /dev/sdaX</pre>
<pre style="margin-top: 0; border-top-style:dashed; padding-top: 0.8em;">resize2fs 1.43-WIP (18-May-2015)
Resizing the filesystem on /dev/sdaX to 26347 (4k) blocks.
The filesystem on /dev/sdaX is now 26347 (4k) blocks long.
</pre>
<div class="archwiki-template-box archwiki-template-box-tip"><strong>Tip:</strong> Shrinking to the minimum size with <code>-M</code> might take very long. You might want to calculate a size just 32 MiB smaller than the current size instead of using <code>-M</code>.</div>
<div class="archwiki-template-box archwiki-template-box-warning"><strong>Warning:</strong> The file system should be shrunk while the underlying device (e.g., a partition) should be kept at its original size. Some graphical tools (e.g., <a href="/title/GParted" class="mw-redirect" title="GParted">GParted</a>) may resize both the file system and the partition, and data loss may occur after encryption.</div>
<p>Now we encrypt it, using the default cipher we do not have to specify it explicitly:
</p>
<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;"># cryptsetup reencrypt --encrypt --reduce-device-size 16M /dev/sdaX</pre>
<pre style="margin-top: 0; border-top-style:dashed; padding-top: 0.8em;">

WARNING!

========

This will overwrite data on LUKS2-temp-12345678-9012-3456-7890-123456789012.new irrevocably.

Are you sure? (Type 'yes' in capital letters): YES
Enter passphrase for LUKS2-temp-12345678-9012-3456-7890-123456789012.new: 
Verify passphrase: 
</pre>
<p>After it finished, the whole <code>/dev/sdaX</code> partition is encrypted, not only the space the file system was shrunk to. As a final step we extend the original <code>ext4</code> file system to occupy all available space again, on the now encrypted partition:
</p>
<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;"># cryptsetup open /dev/sdaX recrypt</pre>
<pre style="margin-top: 0; border-top-style:dashed; padding-top: 0.8em;">Enter passphrase for /dev/sdaX: 
...
</pre>
<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;"># resize2fs /dev/mapper/recrypt</pre>
<pre style="margin-top: 0; border-top-style:dashed; padding-top: 0.8em;">resize2fs 1.43-WIP (18-May-2015)
Resizing the filesystem on /dev/mapper/recrypt to 664807 (4k) blocks.
The filesystem on /dev/mapper/recrypt is now 664807 (4k) blocks long.
</pre>
<pre># mount /dev/mapper/recrypt /mnt
</pre>
<p>The file system is now ready to use. You may want to add it to your <a href="/title/Crypttab" class="mw-redirect" title="Crypttab">crypttab</a>.
</p>
<div class="archwiki-template-box archwiki-template-box-tip"><strong>Tip:</strong> If you have just encrypted your root partition, you might need to perform a number of post-encryption adjustments.
See <a href="/title/Dm-crypt/Encrypting_an_entire_system#Configuring_mkinitcpio" title="Dm-crypt/Encrypting an entire system">Dm-crypt/Encrypting an entire system#Configuring mkinitcpio</a>, <a href="/title/Dm-crypt/Encrypting_an_entire_system#Configuring_the_boot_loader" title="Dm-crypt/Encrypting an entire system">Dm-crypt/Encrypting an entire system#Configuring the boot loader</a>, and <a href="/title/Dm-crypt/Encrypting_an_entire_system#Configuring_GRUB" title="Dm-crypt/Encrypting an entire system">Dm-crypt/Encrypting an entire system#Configuring GRUB</a>.</div>
<h4><span class="mw-headline" id="Re-encrypting_an_existing_LUKS_partition">Re-encrypting an existing LUKS partition</span></h4>
<p>In this example an existing LUKS device is re-encrypted. 
</p>
<div class="archwiki-template-box archwiki-template-box-warning"><strong>Warning:</strong> Double-check you specify encryption options for correctly and <i>never</i> re-encrypt without a <b>reliable backup</b>!</div>
<p>In order to re-encrypt a device with its existing encryption options, they do not need to be specified:
</p>
<pre># cryptsetup reencrypt /dev/sdaX</pre>
<div class="archwiki-template-box archwiki-template-box-note"><strong>Note:</strong> For LUKS1 we will need to use the legacy tool:<pre># cryptsetup-reencrypt /dev/sdaX</pre></div>
<p>Existing keys are retained when re-encrypting a device with a different cipher and/or hash. Another use case is to re-encrypt LUKS devices which have non-current encryption options. Apart from above warning on specifying options correctly, the ability to change the LUKS header may also be limited by its size. For example, if the device was initially encrypted using a CBC mode cipher and 128 bit key-size, the LUKS header will be half the size of above mentioned <code>4096</code> sectors: 
</p>
<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;"># cryptsetup luksDump /dev/sdaX | grep -e "mode" -e "Payload" -e "MK bits"</pre>
<pre style="margin-top: 0; border-top-style:dashed; padding-top: 0.8em;">Cipher mode:   	cbc-essiv:sha256
Payload offset:	<b>2048</b>
MK bits:       	128
</pre>
<p>While it is possible to upgrade the encryption of such a device, it is currently only feasible in two steps. First, re-encrypting with the same encryption options, but using the <code>--reduce-device-size</code> option to make further space for the larger LUKS header. Second, re-encypt the whole device again with the desired cipher. For this reason and the fact that a backup should be created in any case, creating a new, fresh encrypted device to restore into is always the faster option.
</p>
<h3><span class="mw-headline" id="Conversion_from_LUKS1_to_LUKS2_and_back">Conversion from LUKS1 to LUKS2 and back</span></h3>
<p>The <span class="plainlinks archwiki-template-pkg"><a rel="nofollow" class="external text" href="https://archlinux.org/packages/?name=cryptsetup">cryptsetup</a></span> package has <code>convert</code> option that needed for conversion between LUKS1 and LUKS2 container types. The argument <code>--type</code> is <b>required</b>.
</p><p>Migration from LUKS1 to LUKS2:
</p>
<pre># cryptsetup convert --type luks2 /dev/sdaX
</pre>
<div class="archwiki-template-box archwiki-template-box-note"><strong>Note:</strong> The LUKS header size will be 2 MiB instead of 16 MiB.</div>
<p>Rollback to LUKS1 (for example, to boot from <a href="/title/GRUB#Encrypted_/boot" title="GRUB">GRUB with encrypted /boot</a>):
</p>
<pre># cryptsetup convert --type luks1 /dev/sdaX
</pre>
<div class="archwiki-template-box archwiki-template-box-note"><strong>Note:</strong> Conversion from LUKS2 to LUKS1 is <b>not</b> always possible. You may get the following error:
<pre>Cannot convert to LUKS1 format - keyslot 0 is not LUKS1 compatible.
</pre>
</div>
<h2><span class="mw-headline" id="Resizing_encrypted_devices">Resizing encrypted devices</span></h2>
<div class="noprint archwiki-template-message">
<p><a href="/title/File:Tango-view-fullscreen.png" class="image"><img alt="Tango-view-fullscreen.png" src="/images/3/38/Tango-view-fullscreen.png" decoding="async" width="48" height="48" /></a><b>This article or section needs expansion.</b><a href="/title/File:Tango-view-fullscreen.png" class="image"><img alt="Tango-view-fullscreen.png" src="/images/3/38/Tango-view-fullscreen.png" decoding="async" width="48" height="48" /></a></p>
<div><b>Reason:</b> This section should be rewritten to introduce resizing more generically. Perhaps work on it together with <a href="/title/Resizing_LVM-on-LUKS" title="Resizing LVM-on-LUKS">Resizing LVM-on-LUKS</a>. (Discuss in <a rel="nofollow" class="external text" href="https://wiki.archlinux.org/title/Talk:Dm-crypt/Device_encryption">Talk:Dm-crypt/Device encryption</a>)</div>
</div>
<p>If a storage device encrypted with dm-crypt is being cloned (with a tool like dd) to another larger device, the underlying dm-crypt device must be resized to use the whole space. 
</p><p>The destination device is /dev/sdX2 in this example, the whole available space adjacent to the partition will be used:
</p>
<pre># cryptsetup luksOpen /dev/sdX2 sdX2
# cryptsetup resize sdX2
</pre>
<p>Then the underlying file system must be resized.
</p>
<h3><span class="mw-headline" id="Loopback_file_system">Loopback file system</span></h3>
<p>Assume that an encrypted loopback file system is stored in a file <code>/bigsecret</code>, looped to <code>/dev/loop0</code>, mapped to <code>secret</code> and mounted on <code>/mnt/secret</code>, as in the example at <a href="/title/Dm-crypt/Encrypting_a_non-root_file_system#File_container" title="Dm-crypt/Encrypting a non-root file system">dm-crypt/Encrypting a non-root file system#File container</a>.
</p><p>If the container file is currently mapped and/or mounted, unmount and/or close it:
</p>
<pre># umount /mnt/secret
# cryptsetup close secret
# losetup -d /dev/loop0
</pre>
<p>Next, expand the container file with the size of the data you want to add. In this example, the file will be expanded with 1M * 1024, which is 1G.
</p>
<div class="archwiki-template-box archwiki-template-box-warning"><strong>Warning:</strong> Make absolutely sure to use <b>two</b> <code>&gt;</code>,  instead of just one, or else you will overwrite the file instead of appending to it. Making a backup before this step is strongly recommended.</div>
<pre># dd if=/dev/urandom bs=1M count=1024 | cat - &gt;&gt; /bigsecret
</pre>
<p>Now map the container to the loop device:
</p>
<pre># losetup /dev/loop0 /bigsecret
# cryptsetup open /dev/loop0 secret
</pre>
<p>After this, resize the encrypted part of the container to the new maximum size of the container file:
</p>
<pre># cryptsetup resize secret
</pre>
<p>Finally, perform a file system check and, if it is ok, resize it (example for ext2/3/4):
</p>
<pre># e2fsck -f /dev/mapper/secret
# resize2fs /dev/mapper/secret
</pre>
<p>You can now mount the container again:
</p>
<pre># mount /dev/mapper/secret /mnt/secret
</pre>
<h3><span class="mw-headline" id="Integrity_protected_device">Integrity protected device</span></h3>
<p>If the device was formatted with integrity support (e.g., <code>--integrity hmac-sha256</code>) and the backing block device is shrinked, it cannot be opened with this error: <code>device-mapper: reload ioctl on   failed: Invalid argument</code>.
</p><p>To fix this issue without wiping the device again, it can be formatted with the previous master key (keeping the per-sector tags valid).
</p>
<pre># cryptsetup luksDump /dev/sdX2 --dump-master-key --master-key-file=/tmp/masterkey-in-tmpfs.key
# cryptsetup luksFormat /dev/sdX2 --type luks2 --integrity hmac-sha256 --master-key-file=/tmp/masterkey-in-tmpfs.key --integrity-no-wipe
# rm /tmp/masterkey-in-tmpfs.key
</pre>
<h2><span class="mw-headline" id="Keyfiles">Keyfiles</span></h2>
<div class="archwiki-template-box archwiki-template-box-note"><strong>Note:</strong> This section describes using a plaintext keyfile. If you want to encrypt your keyfile giving you two factor authentication see <a href="/title/Dm-crypt/Specialties#Using_GPG,_LUKS,_or_OpenSSL_Encrypted_Keyfiles" title="Dm-crypt/Specialties">Using GPG or OpenSSL Encrypted Keyfiles</a> for details, but please still read this section.</div>
<p><b>What is a keyfile?</b>
</p><p>A keyfile is a file whose data is used as the passphrase to unlock an encrypted volume.
That means if such a file is lost or changed, decrypting the volume may no longer be possible.
</p>
<div class="archwiki-template-box archwiki-template-box-tip"><strong>Tip:</strong> Define a passphrase in addition to the keyfile for backup access to encrypted volumes in the event the defined keyfile is lost or changed.</div>
<p><b>Why use a keyfile?</b>
</p><p>There are many kinds of keyfiles. Each type of keyfile used has benefits and disadvantages summarized below:
</p>
<h3><span class="mw-headline" id="Types_of_keyfiles">Types of keyfiles</span></h3>
<h4><span class="mw-headline" id="passphrase">passphrase</span></h4>
<p>This is a keyfile containing a simple passphrase. The benefit of this type of keyfile is that if the file is lost the data it contained is known and hopefully easily remembered by the owner of the encrypted volume. However the disadvantage is that this does not add any security over entering a passphrase during the initial system start.
</p><p>Example: <code>1234</code>
</p>
<div class="archwiki-template-box archwiki-template-box-note"><strong>Note:</strong> The keyfile containing the passphrase must not have a newline in it. One option is to create it using 
<pre># echo -n 'your_passphrase' &gt; <i>/path/to/keyfile</i>
# chown root:root <i>/path/to/keyfile</i>; chmod 400 <i>/path/to/keyfile</i>
</pre>
<p>If the file contains special characters such as a backslash, rather than escaping these, it is recommended to simply edit the key file directly entering or pasting the passphrase and then remove the trailing newline with a handy perl one-liner:
</p>
<pre># perl -pi -e 'chomp if eof' <i>/path/to/keyfile</i>
</pre>
</div>
<h4><span class="mw-headline" id="randomtext">randomtext</span></h4>
<p>This is a keyfile containing a block of random characters. The benefit of this type of keyfile is that it is much more resistant to dictionary attacks than a simple passphrase. An additional strength of keyfiles can be utilized in this situation which is the length of data used. Since this is not a string meant to be memorized by a person for entry, it is trivial to create files containing thousands of random characters as the key. The disadvantage is that if this file is lost or changed, it will most likely not be possible to access the encrypted volume without a backup passphrase.
</p><p>Example: <code>fjqweifj830149-57 819y4my1-38t1934yt8-91m 34co3;t8y;9p3y-</code>
</p>
<h4><span class="mw-headline" id="binary">binary</span></h4>
<p>This is a binary file that has been defined as a keyfile. When identifying files as candidates for a keyfile, it is recommended to choose files that are relatively static such as photos, music, video clips. The benefit of these files is that they serve a dual function which can make them harder to identify as keyfiles. Instead of having a text file with a large amount of random text, the keyfile would look like a regular image file or music clip to the casual observer. The disadvantage is that if this file is lost or changed, it will most likely not be possible to access the encrypted volume without a backup passphrase. Additionally, there is a theoretical loss of randomness when compared to a randomly generated text file. This is due to the fact that images, videos and music have some intrinsic relationship between neighboring bits of data that does not exist for a random text file. However this is controversial and has never been exploited publicly.
</p><p>Example: images, text, video, ...
</p>
<h3><span class="mw-headline" id="Creating_a_keyfile_with_random_characters">Creating a keyfile with random characters</span></h3>
<h4><span class="mw-headline" id="Storing_the_keyfile_on_a_file_system">Storing the keyfile on a file system</span></h4>
<p>A keyfile can be of arbitrary content and size. 
</p><p>Here <a href="/title/Dd" title="Dd">dd</a> is used to generate a keyfile of 2048 random bytes, storing it in the file <code>/etc/mykeyfile</code>:
</p>
<pre># dd bs=512 count=4 if=/dev/random of=/etc/mykeyfile iflag=fullblock
</pre>
<p>If you are planning to store the keyfile on an external device, you can also simply change the outputfile to the corresponding directory:
</p>
<pre># dd bs=512 count=4 if=/dev/random of=/media/usbstick/mykeyfile iflag=fullblock
</pre>
<p>To deny any access for other users than <code>root</code>:
</p>
<pre># chmod 600 /etc/mykeyfile
</pre>
<h5><span class="mw-headline" id="Securely_overwriting_stored_keyfiles">Securely overwriting stored keyfiles</span></h5>
<p>If you stored your temporary keyfile on a physical storage device, and want to delete it, remember to not just remove the keyfile later on, but use something like
</p>
<pre># shred --remove --zero mykeyfile
</pre>
<p>to securely overwrite it. For overaged file systems like FAT or ext2 this will suffice while in the case of journaling file systems, flash memory hardware and other cases it is highly recommended to <a href="/title/Securely_wipe_disk" title="Securely wipe disk">wipe the entire device</a>.
</p>
<h4><span class="mw-headline" id="Storing_the_keyfile_in_ramfs">Storing the keyfile in ramfs</span></h4>
<p>Alternatively, you can mount a ramfs for storing the keyfile temporarily:
</p>
<pre># mount --mkdir -t ramfs ramfs /root/myramfs
# cd /root/myramfs
</pre>
<p>The advantage is that it resides in RAM and not on a physical disk, therefore it can not be recovered after unmounting the ramfs. After copying the keyfile to another secure and persistent file system, unmount the ramfs again with
</p>
<pre># umount /root/myramfs
</pre>
<h3><span class="mw-headline" id="Configuring_LUKS_to_make_use_of_the_keyfile">Configuring LUKS to make use of the keyfile</span></h3>
<p>Add a keyslot for the keyfile to the LUKS header:
</p>
<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;"># cryptsetup luksAddKey /dev/sda2 /etc/mykeyfile</pre>
<pre style="margin-top: 0; border-top-style:dashed; padding-top: 0.8em;">Enter any LUKS passphrase:
key slot 0 unlocked.
Command successful.
</pre>
<h3><span class="mw-headline" id="Manually_unlocking_a_partition_using_a_keyfile">Manually unlocking a partition using a keyfile</span></h3>
<p>Use the <code>--key-file</code> option when opening the LUKS device:
</p>
<pre># cryptsetup open /dev/sda2 <i>dm_name</i> --key-file /etc/mykeyfile
</pre>
<h3><span class="mw-headline" id="Unlocking_the_root_partition_at_boot">Unlocking the root partition at boot</span></h3>
<p>This is simply a matter of configuring <a href="/title/Mkinitcpio" title="Mkinitcpio">mkinitcpio</a> to include the necessary modules or files and configuring the <a href="/title/Dm-crypt/System_configuration#cryptkey" title="Dm-crypt/System configuration">cryptkey</a> <a href="/title/Kernel_parameter" class="mw-redirect" title="Kernel parameter">kernel parameter</a> to know where to find the keyfile.
</p><p>Two cases are covered below:
</p>
<ol><li>Using a keyfile stored on an external medium (e.g. a USB stick)</li>
<li>Using a keyfile embedded in the initramfs</li></ol>
<h4><span class="mw-headline" id="With_a_keyfile_stored_on_an_external_media">With a keyfile stored on an external media</span></h4>
<h5><span class="mw-headline" id="Configuring_mkinitcpio">Configuring mkinitcpio</span></h5>
<p>You have to add the kernel module for the drive's <a href="/title/File_system" class="mw-redirect" title="File system">file system</a> to the <a href="/title/Mkinitcpio#MODULES" title="Mkinitcpio">MODULES array</a> in <code>/etc/mkinitcpio.conf</code>. For example, add <code>ext4</code> if the file system is <a href="/title/Ext4" title="Ext4">Ext4</a> or <code>vfat</code> in case it is <a href="/title/FAT" title="FAT">FAT</a>:
</p>
<pre>MODULES=(vfat)
</pre>
<p>If there are messages about bad superblock and bad codepage at boot, then you need an extra codepage module to be loaded. For instance, you may need <code>nls_iso8859-1</code> module for <code>iso8859-1</code> codepage.
</p><p><a href="/title/Regenerate_the_initramfs" class="mw-redirect" title="Regenerate the initramfs">Regenerate the initramfs</a>.
</p>
<h5><span class="mw-headline" id="Configuring_the_kernel_parameters">Configuring the kernel parameters</span></h5>
<ul><li>For a busybox-based initramfs using the <a href="/title/Dm-crypt/System_configuration#Using_encrypt_hook" title="Dm-crypt/System configuration">encrypt</a> hook, see <a href="/title/Dm-crypt/System_configuration#cryptkey" title="Dm-crypt/System configuration">dm-crypt/System configuration#cryptkey</a>.</li>
<li>For a systemd based initramfs using the <a href="/title/Sd-encrypt" class="mw-redirect" title="Sd-encrypt">sd-encrypt</a> hook, see <a href="/title/Dm-crypt/System_configuration#rd.luks.key" title="Dm-crypt/System configuration">dm-crypt/System configuration#rd.luks.key</a>.</li></ul>
<h4><span class="mw-headline" id="With_a_keyfile_embedded_in_the_initramfs">With a keyfile embedded in the initramfs</span></h4>
<div class="archwiki-template-box archwiki-template-box-warning"><strong>Warning:</strong> Use an embedded keyfile <b>only</b> if you protect the keyfile sufficiently by:
<ul><li>Using some form of authentication earlier in the boot process. Otherwise auto-decryption will occur, defeating completely the purpose of block device encryption.</li>
<li><code>/boot</code> is encrypted. Otherwise root on a different installation (including the <a href="/title/Installation_guide#Boot_the_live_environment" title="Installation guide">live environment</a>) can extract your key from the initramfs, and unlock the device without any other authentication.</li></ul></div>
<p>This method allows to use a specially named keyfile that will be embedded in the <a href="/title/Initramfs" class="mw-redirect" title="Initramfs">initramfs</a> and picked up by the <code>encrypt</code> <a href="/title/Mkinitcpio#HOOKS" title="Mkinitcpio">hook</a> to unlock the root file system (<code>cryptdevice</code>) automatically. It may be useful to apply when using the <a href="/title/GRUB#Encrypted_/boot" title="GRUB">GRUB early cryptodisk</a> feature, in order to avoid entering two passphrases during boot.
</p><p>The <code>encrypt</code> hook lets the user specify a keyfile with the <code>cryptkey</code> kernel parameter: in the case of initramfs, the syntax is <code>rootfs:<i>/path/to/keyfile</i></code>. See <a href="/title/Dm-crypt/System_configuration#cryptkey" title="Dm-crypt/System configuration">dm-crypt/System configuration#cryptkey</a>. Besides, this kernel parameter defaults to use <code>/crypto_keyfile.bin</code>, and if the initramfs contains a valid key with this name, decryption will occur automatically without the need to configure the <code>cryptkey</code> parameter.
</p><p>If using <code>sd-encrypt</code> instead of <code>encrypt</code>, specify the location of the keyfile with the <code>rd.luks.key</code> kernel parameter: in the case of initramfs, the syntax is <code><i>/path/to/keyfile</i></code>. See <a href="/title/Dm-crypt/System_configuration#rd.luks.key" title="Dm-crypt/System configuration">dm-crypt/System configuration#rd.luks.key</a>. This kernel parameter defaults to using <code>/etc/cryptsetup-keys.d/<i>name</i>.key</code> (where <code><i>name</i></code> is the <code><i>dm_name</i></code> used for decryption in <a href="#Encrypting_devices_with_cryptsetup">#Encrypting devices with cryptsetup</a>) and can be omitted if initramfs contains a valid key with this path.
</p><p><a href="#Creating_a_keyfile_with_random_characters">Generate the keyfile</a>, give it suitable permissions and <a href="#Adding_LUKS_keys">add it as a LUKS key</a>:
</p>
<pre># dd bs=512 count=4 if=/dev/random of=/crypto_keyfile.bin iflag=fullblock
# chmod 600 /crypto_keyfile.bin
# cryptsetup luksAddKey /dev/sdX# /crypto_keyfile.bin
</pre>
<div class="archwiki-template-box archwiki-template-box-note"><strong>Note:</strong> The initramfs is generated by mkinitcpio with <code>600</code> <a href="/title/Permissions" class="mw-redirect" title="Permissions">permissions</a> by default, so regular users are not able to read the keyfile via the generated initramfs.</div>
<p>Include the key in <a href="/title/Mkinitcpio#BINARIES_and_FILES" title="Mkinitcpio">mkinitcpio's FILES array</a>:
</p>
<pre style="margin-bottom: 0; border-bottom:none; padding-bottom:0.8em;">/etc/mkinitcpio.conf</pre>
<pre style="margin-top: 0; border-top-style:dashed; padding-top: 0.8em;">FILES=(/crypto_keyfile.bin)</pre>
<p>Finally <a href="/title/Regenerate_the_initramfs" class="mw-redirect" title="Regenerate the initramfs">regenerate the initramfs</a>.
</p><p>On the next reboot you should only have to enter your container decryption passphrase once.
</p><p>(<a rel="nofollow" class="external text" href="https://www.pavelkogan.com/2014/05/23/luks-full-disk-encryption/#bonus-login-once">source</a>)
</p>
<!-- 
NewPP limit report
Cached time: 20220709140133
Cache expiry: 86400
Reduced expiry: false
Complications: []
CPU time usage: 0.130 seconds
Real time usage: 0.132 seconds
Preprocessor visited node count: 1875/1000000
Post‐expand include size: 25660/2097152 bytes
Template argument size: 13518/2097152 bytes
Highest expansion depth: 7/100
Expensive parser function count: 0/100
Unstrip recursion depth: 0/20
Unstrip post‐expand size: 323/5000000 bytes
-->
<!--
Transclusion expansion time report (%,ms,calls,template)
100.00%   54.741      1 -total
 20.15%   11.033    139 Template:Ic
  8.43%    4.614      7 Template:Tip
  8.21%    4.494      3 Template:Expansion
  8.12%    4.444      1 Template:Lowercase_title
  8.00%    4.382     29 Template:Hc
  6.02%    3.293      3 Template:Man
  5.74%    3.142      5 Template:Pkg
  4.54%    2.487      9 Template:Warning
  4.30%    2.355      3 Template:META_Message
-->

<!-- Saved in parser cache with key archwiki:pcache:idhash:17195-0!canonical and timestamp 20220709140133 and revision id 736920. Serialized with JSON.
 -->
</div>
<div class="printfooter">Retrieved from "<a dir="ltr" href="https://wiki.archlinux.org/index.php?title=Dm-crypt/Device_encryption&amp;oldid=736920">https://wiki.archlinux.org/index.php?title=Dm-crypt/Device_encryption&amp;oldid=736920</a>"</div></div>
		<div id="catlinks" class="catlinks" data-mw="interface"><div id="mw-normal-catlinks" class="mw-normal-catlinks"><a href="/title/Special:Categories" title="Special:Categories">Category</a>: <ul><li><a href="/title/Category:Data-at-rest_encryption" title="Category:Data-at-rest encryption">Data-at-rest encryption</a></li></ul></div><div id="mw-hidden-catlinks" class="mw-hidden-catlinks mw-hidden-cats-hidden">Hidden category: <ul><li><a href="/title/Category:Pages_or_sections_flagged_with_Template:Expansion" title="Category:Pages or sections flagged with Template:Expansion">Pages or sections flagged with Template:Expansion</a></li></ul></div></div>
	</div>


</main>

	</div> 
</div> 

<div class="mw-workspace-container mw-footer-container">
	<div class="mw-content-container">
		
<footer id="footer" class="mw-footer" role="contentinfo" >
	<ul id="footer-info">
	<li id="footer-info-lastmod"> This page was last edited on 9 July 2022, at 14:01.</li>
	<li id="footer-info-copyright">Content is available under <a class="external" rel="nofollow" href="http://www.gnu.org/copyleft/fdl.html">GNU Free Documentation License 1.3 or later</a> unless otherwise noted.</li>
</ul>

	<ul id="footer-places">
	<li id="footer-places-privacy"><a href="https://terms.archlinux.org/docs/privacy-policy/" class="extiw" title="archlinux-service-agreements:privacy-policy">Privacy policy</a></li>
	<li id="footer-places-about"><a href="/title/ArchWiki:About" title="ArchWiki:About">About ArchWiki</a></li>
	<li id="footer-places-disclaimer"><a href="/title/ArchWiki:General_disclaimer" title="ArchWiki:General disclaimer">Disclaimers</a></li>
</ul>

	
</footer>

	</div>
</div>
	</div> 
</div> 

<script>(RLQ=window.RLQ||[]).push(function(){mw.config.set({"wgPageParseReport":{"limitreport":{"cputime":"0.130","walltime":"0.132","ppvisitednodes":{"value":1875,"limit":1000000},"postexpandincludesize":{"value":25660,"limit":2097152},"templateargumentsize":{"value":13518,"limit":2097152},"expansiondepth":{"value":7,"limit":100},"expensivefunctioncount":{"value":0,"limit":100},"unstrip-depth":{"value":0,"limit":20},"unstrip-size":{"value":323,"limit":5000000},"timingprofile":["100.00%   54.741      1 -total"," 20.15%   11.033    139 Template:Ic","  8.43%    4.614      7 Template:Tip","  8.21%    4.494      3 Template:Expansion","  8.12%    4.444      1 Template:Lowercase_title","  8.00%    4.382     29 Template:Hc","  6.02%    3.293      3 Template:Man","  5.74%    3.142      5 Template:Pkg","  4.54%    2.487      9 Template:Warning","  4.30%    2.355      3 Template:META_Message"]},"cachereport":{"timestamp":"20220709140133","ttl":86400,"transientcontent":false}}});mw.config.set({"wgBackendResponseTime":95});});</script>
</body>
<!-- Cached/compressed 20220709140409 -->
</html>
