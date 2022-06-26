#!/bin/bash

BORDERLINE=20000 #in Megabytes

for name in $(cat /etc/passwd | cut -d: -f1,2 | awk -F: '$2>99{print $1}'); do

	echo -n "User $name exceeds disk quota. Disk usage is:"
	# <- change directories based on the system 
	find /home -xdev -user $name -type f -ls | awk '{sum += $7} END {print $sum / (1024*1024) "Mbytes"}'

done | awk "\$9 > $BORDERLINE {print \$0}" #flow if statement
exit 0
