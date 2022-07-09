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


https://geekflare.com/linux-server-local-dns-caching/

https://opensource.com/article/22/3/dns-caching-edge