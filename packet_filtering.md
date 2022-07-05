# Implement packet filtering

## Ip tables

Ip tables are collection of chains that have specific targets. 
Specific INPUT chain for a specific situation(protocol or ip adress)can have a target to DROP it. `CHAIN*******TARGET(-j)`.

Rules in iptables can be appended or inserted. They are processed from top to the bottom. command:
	* `iptables -A    / iptables -I`.

* `iptables -I INPUT -s 10.0.0.1 -j DROP` :
	* `-I` - insert new rule.
	* `INPUT` - this is chain. There are 3 chains `INPUT` `OUTPUT` `FORWARD`
	* `-s` - trafic from Source 
	* `-j` - target DROP, there can be `ACCEPT` `REJECT` `DROP`


## Subnets 
* `iptables -I INPUT -s 10.0.0.1/24 -j DROP` 
	* Add a rule to entire subnet.

## Ports
* `iptables -I INPUT -s 10.0.0.1 -p tcp --dport 80 -j DROP`:
	* `-p` - protocol.
	* `--dport` - destination protocol. 


## Other commands

* `iptables -L` - show all policies.
* `iptables --flush` - flushes all the rules.  
* `iptables -L --line-numbers` - shows rules with line numbers.
* `iptables -D INPUT 1` - delete 1 rule from INPUT chain.

---

* `iptables -A INPUT --protocol icmp --in-interface enp0s3 -j DROP`
	* block incomming pings to the network interface on this server

* `iptables -I OUTPUT -s <ip adress> -j REJECT`


