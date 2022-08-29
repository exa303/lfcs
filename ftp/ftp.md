## Install VSFTPD


* `sudo apt update`
* `sudo apt install -y vsftpd`

The VSFTPD can be configured through the `/etc/vsftpd.conf` file.

configuration:

```bash

listen=NO
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_umask=022
dirmessage_enable=YES
use_localtime=YES
xferlog_enable=YES
connect_from_port_20=YES
chroot_local_user=YES
secure_chroot_dir=/var/run/vsftpd/empty
pam_service_name=vsftpd
rsa_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem
rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
ssl_enable=Yes
pasv_enable=Yes
pasv_min_port=10000
pasv_max_port=10100
allow_writeable_chroot=YES
ssl_tlsv1=YES
ssl_sslv2=NO
ssl_sslv3=NO

```

## Check firewall:

* `sudo ufw allow 20/tcp`
* `sudo ufw allow 21/tcp`

## Enable deamons

* `sudo systemctl start vsftpd.service`

## Run
* `ftp <ip-address>`


## Ftp commands
<table>
<th>Command</th>
<th>Information</th>
</tr>
<tr class="tcw">
<td><b>!</b></td>
<td>The exclamation point command switches temporarily from FTP to operating system. When using the operating system, typing <b>exit</b> takes you back to the FTP command line.</td>
</tr>
<tr class="tcw">
<td><b>?</b></td>
<td>Access the help screen.</td>
</tr>
<tr class="tcw">
<td><b>append</b></td>
<td><a href="/jargon/a/append.htm">Append</a> text to a local file.</td>
</tr>
<tr class="tcw">
<td><b>ascii</b></td>
<td>Switch to <a href="/jargon/a/ascii.htm">ASCII</a> transfer mode.</td>
</tr>
<tr class="tcw">
<td><b>bell</b></td>
<td>Turns bell mode on or off.</td>
</tr>
<tr class="tcw">
<td><b>binary</b></td>
<td>Switches to <a href="/jargon/b/binary.htm">binary</a> transfer mode.</td>
</tr>
<tr class="tcw">
<td><b>bye</b></td>
<td><a href="/jargon/e/exit.htm">Exits</a> from FTP.</td>
</tr>
<tr class="tcw">
<td><b>cd</b></td>
<td>Changes <a href="/jargon/d/director.htm">directory</a>.</td>
</tr>
<tr class="tcw">
<td><b>close</b></td>
<td>Exits from FTP.</td>
</tr>
<tr class="tcw">
<td><b>delete</b></td>
<td><a href="/jargon/d/delete.htm">Deletes</a> a file.</td>
</tr>
<tr class="tcw">
<td><b>debug</b></td>
<td>Sets <a href="/jargon/d/debuggin.htm">debugging</a> on or off.</td>
</tr>
<tr class="tcw">
<td><b>dir</b></td>
<td>Lists files if connected.<br><br> <b>dir -C</b> lists the files in wide format.<br> <b>dir -1</b> lists the files in bare format in <a href="/jargon/a/alphabetic.htm">alphabetic</a> order<br> <b>dir -r</b> lists directory in reverse alphabetic order.<br> <b>dir -R</b> lists all files in current directory and subdirectories.<br> <b>dir -S</b> lists files in bare format in alphabetic order.</td>
</tr>
<tr class="tcw">
<td><b>disconnect</b></td>
<td>Exits from FTP.</td>
</tr>
<tr class="tcw">
<td><b>get</b></td>
<td>Grabs file from the connected computer.</td>
</tr>
<tr class="tcw">
<td><b>glob</b></td>
<td>Sets <a href="/jargon/g/glob.htm">globbing</a> on or off. When turned off the file name in the put and get commands is taken literally and wildcards are not used.</td>
</tr>
<tr class="tcw">
<td><b>hash</b></td>
<td>Sets <a href="/jargon/h/hash.htm">hash mark</a> printing on or off. When turned on, for each 1024 bytes of data received, a hash mark (#) is displayed.</td>
</tr>
<tr class="tcw">
<td><b>help</b></td>
<td>Access the help screen and displays information about command if command typed after help.</td>
</tr>
<tr class="tcw">
<td><b>lcd</b></td>
<td>Displays local directory if typed alone, or if path typed after lcd, changes local directory.</td>
</tr>
<tr class="tcw">
<td><b>literal</b></td>
<td>Sends a literal command to the connected computer with an expected one line response.</td>
</tr>
<tr class="tcw">
<td><b>ls</b></td>
<td>Lists files of the remotely connected computer.</td>
</tr>
<tr class="tcw">
<td><b>mdelete</b></td>
<td>Multiple delete.</td>
</tr>
<tr class="tcw">
<td><b>mdir</b></td>
<td>Lists contents of multiple remote directories.</td>
</tr>
<tr class="tcw">
<td><b>mget</b></td>
<td>Get multiple files.</td>
</tr>
<tr class="tcw">
<td><b>mkdir</b></td>
<td>Make directory.</td>
</tr>
<tr class="tcw">
<td><b>mls</b></td>
<td>Lists contents of multiple remote directories.</td>
</tr>
<tr class="tcw">
<td><b>mput</b></td>
<td>Sent multiple files</td>
</tr>
<tr class="tcw">
<td><b>open</b></td>
<td>Opens <a href="/jargon/a/address.htm">address</a>.</td>
</tr>
<tr class="tcw">
<td><b>prompt</b></td>
<td>Enables or disables the <a href="/jargon/p/prompt.htm">prompt</a>.</td>
</tr>
<tr class="tcw">
<td><b>put</b></td>
<td>Send one file.</td>
</tr>
<tr class="tcw">
<td><b>pwd</b></td>
<td>Print <a href="/jargon/c/currentd.htm">working directory</a>.</td>
</tr>
<tr class="tcw">
<td><b>quit</b></td>
<td>Exits from FTP.</td>
</tr>
<tr class="tcw">
<td><b>quote</b></td>
<td>Same as the literal command.</td>
</tr>
<tr class="tcw">
<td><b>recv</b></td>
<td>Receive file.</td>
</tr>
<tr class="tcw">
<td><b>remotehelp</b></td>
<td>Get help from remote server.</td>
</tr>
<tr class="tcw">
<td><b>rename</b></td>
<td><a href="/jargon/r/rename.htm">Renames</a> a file.</td>
</tr>
<tr class="tcw">
<td><b>rmdir</b></td>
<td>Removes a directory on the remote computer.</td>
</tr>
<tr class="tcw">
<td><b>send</b></td>
<td>Send single file.</td>
</tr>
<tr class="tcw">
<td><b>status</b></td>
<td>Shows status of currently enabled and disabled options.</td>
</tr>
<tr class="tcw">
<td><b>trace</b></td>
<td>Toggles <a href="/jargon/p/packet.htm">packet</a> tracing.</td>
</tr>
<tr class="tcw">
<td><b>Type</b></td>
<td>Set file transfer type.</td>
</tr>
<tr class="tcw">
<td><b>user</b></td>
<td>Send new user information.</td>
</tr>
<tr class="tcw">
<td><b>verbose</b></td>
<td>Sets <a href="/jargon/v/verbose-mode.htm">verbose</a> on or off.</td>
</tr>
</table>