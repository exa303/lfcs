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
	* `-j` - target, there can be `ACCEPT` `REJECT` `DROP` targets for the chain.
	* `-o` - output Interface name
	* `-i` - input interface
	* `-p` - protocol.


## Subnets 
* `iptables -I INPUT -s 10.0.0.1/24 -j DROP` 
	* Add a rule to entire subnet.

## Ports
* `iptables -I INPUT -p tcp --dport 80 -j DROP`: this will drop ALL trafic comming to port 80.

	* `--dport` - destination port. 

* `iptables -I INPUT -p tcp --dport 80 -s 177.535.33.123 -j ACCEPT` : it will accept tcp requests to port 80 only from ip 177.535.33.123 (assuming you still have previous rule active). 

## Save Load configuration

* `iptables-save > savedrules.txt` - save rules to file.
* `iptables-restore < savedrules.txt ` - load rules from a file.


## Other commands

* `sudo /sbin/iptables-save` - save changes to make them persistent.
* `iptables -L` - show all policies.
* `iptables --flush` - flushes all the rules. or `-F`
* `iptables -L --line-numbers` - shows rules with line numbers.
* `iptables -D INPUT 1` - delete 1 rule from INPUT chain.
* `sudo iptables -L OUTPUT` - list OUTPUT chain only

---

* `iptables -A INPUT --protocol icmp --in-interface enp0s3 -j DROP`: this will block incomming pings to the network interface on this server. 

* `iptables -I OUTPUT -s <ip adress> -j REJECT`






