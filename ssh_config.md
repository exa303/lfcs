# ssh configuration

* `ssh-keygen` - generates public and private key pair
* `ssh-keygen -b 4096` - generate public private LONGER key pair.

* `ssh-keygen -p`- change pass fraze.
* `ssh-keygen -l` - check signature. Each SSH key pair share a single cryptographic “fingerprint” which can be used to uniquely identify the keys.

* `ssh-copy-id username@remote_host`- To copy your public key to a server, allowing you to authenticate without a password, a number of approaches can be taken.
After typing in the password, the contents of your `~/.ssh/id_rsa.pub` key will be appended to the end of the user account’s `~/.ssh/authorized_keys`.
* alternative:
    * `cat ~/.ssh/id_rsa.pub | ssh username@remote_host "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"`

## Forwarding your SSH Credentials to Use on a Server

If you wish to be able to connect without a password to one server from within another server, you will need to forward your SSH key information. This will allow you to authenticate to another server through the server you are connected to, using the credentials on your local computer.

To start, you must have your SSH agent started and your SSH key added to the agent (see earlier). After this is done, you need to connect to your first server using the -A option. This forwards your credentials to the server for this session:

* `ssh -A username@remote_host`.

Disabling Password Authentication

If you have SSH keys configured, tested, and working properly, it is probably a good idea to disable password authentication. This will prevent any user from signing in with SSH using a password.

To do this, connect to your remote server and open the /etc/ssh/sshd_config file with root or sudo privileges:
* `sudo nano /etc/ssh/sshd_config`
    *  `PasswordAuthentication no`
    *   `sudo service ssh restart`

## Changing the Port that the SSH Daemon Runs On:
*  `sudo nano /etc/ssh/sshd_config` -
```bash
        #Port 22
        Port 4444

```

* `AllowUsers user1 user2` - Limiting the Users Who can Connect Through SSH
* `AllowGroups sshmembers` - Limiting the Users that belong to the Groups Who can Connect Through SSH

* `PermitRootLogin no` - Disabling Root Login

## Configuring Local Tunneling to a Server

* `ssh -f -N -L 8888:your_domain:80 username@remote_host`
* `ssh -L your_port:site_or_IP_to_access:site_port username@host`
Now, if you point your local web browser to 127.0.0.1:8888, you should see whatever content is at your_domain on port 80.
I AM ACCESSING
* `ps aux | grep 8888` - to find a PID
*    `kill 5965`


Another option is to start the connection without the -f flag. This will keep the connection in the foreground, preventing you from using the terminal window for the duration of the forwarding. The benefit of this is that you can easily kill the tunnel by typing CTRL-C.


## Configuring Remote Tunneling to a Server
I IS ACCESSSING
* `ssh -f -N -R 8888:your_domain:80 username@remote_host`
* `ssh -R remote_port:site_or_IP_to_access:site_port username@host`

Now, on the remote host, opening a web browser to 127.0.0.1:8888 would allow you to see whatever content is at your_domain on port 80.

## Configuring Dynamic Tunneling to a Remote Server

SSH connections can be used to tunnel traffic from ports on the local host to ports on a remote host.

A dynamic tunnel is similar to a local tunnel in that it allows the local computer to connect to other resources through a remote host. A dynamic tunnel does this by simply specifying a single local port. Applications that wish to take advantage of this port for tunneling must be able to communicate using the SOCKS protocol so that the packets can be correctly redirected at the other side of the tunnel.

Traffic that is passed to this local port will be sent to the remote host. From there, the SOCKS protocol will be interpreted to establish a connection to the desired end location. This set up allows a SOCKS-capable application to connect to any number of locations through the remote server, without multiple static tunnels.

To establish the connection, we will pass the -D flag along with the local port where we wish to access the tunnel. We will also use the -f flag, which causes SSH to go into the background before executing and the -N flag, which does not open a shell or execute a program on the remote side.

* `ssh -f -N -D 7777 username@remote_host`



