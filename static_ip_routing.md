# Statically route IP traffic

Lets say you want to ping docker container runing on external machine. You CAN'T ping it via 179.890.92.12, becouse your local machine doesn't have a route set to this ip. So you need to manualy specify gateway (ip adress of a phisical machine that docker container is running on) and a ip adress of that container. That is manualy(staticaly) add route.

We will use `ip route` - utility

* `ip route add 172.17.42.0/24 via 192.168.1.131 dev enp0s3` - 
	* ip route add `172.17.42.0/24`<-the target adress(container adress), via `192.168.1.131` <- machines phisical adress, dev `enp0s3` <- our default network device that we get from `ip route show`.
* `ip route delete 172.17.42.0/24` - remove route from routing table.


## commands
* `netstat -rn ` - check existing routes. `-r` - dispaly route, `-n` - show numbers.
* `traceroute google.com` - check for first hop to know gateway.
* `ip route show` - shows routing table


