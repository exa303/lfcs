# netcat

* `nc [options] host port`
* `nc -v example.com 80` - connect to exmple.com via port 80


## listening for tcp
* `nc -lp 4000` - This command will make netcat start listening on port 4000. By default, netcat creates TCP connections. You can create UDP connections using the `-u` flag. However, we’ll use the default TCP connection for now.
    * `nc -vlp 4000` - verbose output

In browser try looking at 127.0.0.1:4000.
In netcat try to send back header file.
```
HTTP/1.1 200 OK
Content-Type: text/html; charset=UTF-8
Server: nooblinux
```


## netcat chat via tcp

* node 1 `nc -vlp 4000`
* node 2 `nc -v <node1 ip address> 4000`

## netcat chat via udp

* node 1 `nc -vlpu 4000`
* node 2 `nc -v <node1 ip address> 4000`

## sending files 

* client `nc -vlp 4000 > whatever_may_come.zip`
* server `nc -v 192.168.145.131 4000 < nooblinux_assets.zip`

## scanning ports

* `nc vz <ip> 80-800` - scan for ports. redirect error ro stout and grep for succeeded ones `2>&1 | grep succee`
