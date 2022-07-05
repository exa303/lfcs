# Implement packet filtering

## Ip tables

Rules in iptables can be appended or inserted. They are processed from top to the bottom. command:
	* `iptables -A    / iptables -I`.

* `iptables -I INPUT -s 10.0.0.1 -j DROP` :
	* `-I` - insert new rule.
	* `INPUT` - this is chain. There are 3 chains `INPUT` `OUTPUT` `FORWARD`
	* `-s` - trafic from Source 
	* `-j` - policy DROP

---
** Subnets **
* `iptables -I INPUT -s 10.0.0.1/24 -j DROP` 
---

* `iptables -L` - show all policies.
* `iptables --flush` - flushes all the rules.  

* `iptables -A INPUT --protocol icmp --in-interface enp0s3 -j DROP` - 