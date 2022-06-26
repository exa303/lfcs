#!/bin/bash

#in order to access all directories efectivaly run this program as a root.

if [[ `id -u` -ne 0 ]]; then
	echo "Please run $0 as ROOT"
	exit 1
fi

echo "Runing..."

BORDERLINE=20000 #in Megabytes

for name in $(cat /etc/passwd | cut -d: -f1,2 | awk -F: '$2>99{print $1}'); do

	echo -n "User $name exceeds disk quota. Disk usage is:"
			# <- change directories based on the system 
	find /home -xdev -user $name -type f -ls | awk '{sum += $7} END {print sum / (1024*1024)}'

done | awk -F: "\$2 > $BORDERLINE {print \$0}"

echo "Done."
exit 0
