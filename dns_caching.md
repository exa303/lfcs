# DNS caching server 

Systemd-resolved works by running a small local caching DNS server which we will configure to start on boot. We will then re-configure the rest of the system to direct their DNS queries to the local caching systemd-resolved DNS.

* `resolvectl status` - check if you are already running systemd-resolved.

We do not need to install systemd-resolved as already a part of systemd. All that we need to do is to start it to get the DNS caching server running and then enable it to start it on boot.

If you get the message:
```
$ resolvectl status
Failed to get global data: Unit dbus-org.freedesktop.resolve1.service not found.
```
You are not running systemd-resolved and should move on to the next section. If, instead, you see output that begins with something like the following:

```
Global
       LLMNR setting: yes
MulticastDNS setting: yes
  DNSOverTLS setting: opportunistic
      DNSSEC setting: allow-downgrade
    DNSSEC supported: no
  Current DNS Server: 1.1.1.1
         DNS Servers: 1.1.1.1
                      1.0.0.1
```

Then you are already running systemd-resolved and do not need to enable it.

## Enabling and configuring systemd-resolved.

We do not need to install systemd-resolved as already a part of systemd. All that we need to do is to start it to get the DNS caching server running and then enable it to start it on boot.

* `sudo systemctl start systemd-resolved.service`
* `sudo systemctl enable systemd-resolved.service` - enable at boot.

The last item of configuration left is to set the DNS servers that systemd-resolved will query to resolved domains. There are many options here, but either of the following pairs is free, fast, and they both support DNSSEC and DoT:

Google Public DNS:

    8.8.8.8
    8.8.4.4

Cloudflare Public DNS:

    1.1.1.1
    1.0.0.1


* `sudo nano /etc/systemd/resolved.conf` - configuration file for resolved.
	* `DNS=1.1.1.1 1.0.0.1` - add this line to config file.


### Configuring the system to use systemd-resolved

Your system can be configured in several ways to use systemd-resolved, but we will look at two configurations that cover most use cases. The first is the recommended configuration, and the second is the compatibility configuration. The difference between the two is how the `/etc/resolv.conf` file is managed.

The `/etc/resolv.conf` file holds the IP addresses of the nameservers that programs on the system should query. Programs that need to make DNS queries will consult this file to find out what servers they should contact to make those queries.

The two modes of systemd-resolved center around how the contents of this file are managed. In the recommended mode, /`etc/resolv.conf` is made a symlink to `/run/systemd/resolve/stub-resolv.conf.` This file is managed by systemd-resolved and therefore systemd-resolved manages the DNS configuration information for all other programs on the system.

This can cause problems when other programs try to manage the contents of /`etc/resolv.conf.` Compatibility mode leaves `/etc/resolv.conf `in place allowing other programs to manage it while systemd-resolved uses that DNS information. In this mode, the other programs managing `/etc/resolv.conf` must be configured to set` 127.0.0.53` as the system nameserver in `/etc/resolv.conf`.


### Configuring the recommended mode

When we configure this mode systemd-resolved will manage `/etc/resolv.conf` by making it a symlink to `/run/systemd/resolve/stub-resolv.conf`. We will need to do this by hand as it is not configured automatically.

First, delete or rename the existing `/etc/resolv.conf` file. Renaming is a better option to deleting it as it will have the same effect but you can always refer to the original if you need the information it contains. Here, we rename `/etc/resolv.conf` using the `mv` command:

`$ sudo mv /etc/resolv.conf /etc/resolv.conf.original`

Next, create the symlink:

`$ sudo ln -s /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf`

Finally, restart systemd-resolved:

`$ sudo systemctl restart systemd-resolved.service`

Configuring the compatibility mode

In this mode, you need to ensure that the local nameserver that systemd-resolved has started is queried by system services. Open `/etc/resolv.conf` in a text editor, here the nano editor is used:

`$ sudo nano /etc/resolv.conf`

Delete any lines you encounter that begin with “nameserver” and add this line:

`nameserver 127.0.0.53`

This edit may get changed by any other program that is managing /`etc/resolv.conf`. If this is the case then you will need to configure those programs to use this nameserver to make the edit permanent.


## Debugging systemd-resolved

Discovering exactly how your system is making DNS queries after you have made these changes can be difficult. The most effective way method of observing what is happening is to put systemd-resolved into debugging mode and watch the log file.

systemd-resolved is a systemd service, which means that it can be easily put into debugging mode by creating a drop-in service file that contains the debug setting. The following command will create the correct file in the correct location:

`$ sudo systemctl edit systemd-resolved.service
`
Paste the following lines into the editor then save and exit:
```
[Service]
Environment=SYSTEMD_LOG_LEVEL=debug
```
The systemd-resolved service will be automatically reloaded on a successful save and exit.

Open a second terminal to the same server and follow the journald log for the systemd-resolved service:

`$ sudo journalctl -f -u systemd-resolved`

A line that begins “Using DNS server” e.g.:

`Using DNS server 1.1.1.1 for transaction 19995.`

Tells you exactly which DNS server is being used for DNS queries. In this case, the Cloudflare DNS server at 1.1.1.1 was queried.

Lines that being “Cache miss” indicate that the domain name has not been cached. E.g.:

Cache miss for example.com IN SOA

Lines that begin “Positive cache hit” e.g.:

`Positive cache hit for example.com IN A`

Indicate that systemd-resolved has queried this domain before and the answer was served from the cache in the local memory.

You should disable debugging mode when you have finished working systemd-resolved as it will create a very large log file on a busy system. You can disable the debug logging by running:

`$ sudo systemctl edit systemd-resolved.service`

and deleting the two lines, you added then saving and exiting the editor.

## Using secure DNS queries

systemd-resolved is one of the few, currently available DNS servers that support both DNSSEC and DNSoverTLS. Both of these help to ensure that you are receiving genuine DNS information (DNSSEC) and that no one can snoop on your DNS traffic as it passes over the internet. (DoT).

These options are easily enabled by opening systemd-resolved’s main configuration file with a text editor:

`$ sudo nano /etc/systemd/resolved.conf`

And editing the file so that the following two lines are set:

```
DNSSEC=allow-downgrade
DNSOverTLS=opportunistic

```

Save and exit the editor then reload systemd-resolved:

`$ sudo systemctl restart systemd-resolved.service
`
As long as the DNS server you have set support DNSSEC and DoT your DNS queries will be protected. The Google and Cloudflare public DNS servers both support these protocols.


**References:**
https://geekflare.com/linux-server-local-dns-caching/
https://opensource.com/article/22/3/dns-caching-edge