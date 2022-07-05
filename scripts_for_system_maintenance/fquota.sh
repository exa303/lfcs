#!/bin/bash

#in order to access all directories efectivaly run this program as a root.
#this program checks what is the usage(space) of each user on a system
#if it is above BORDERLINE metric, program notifies.

if [[ `id -u` -ne 0 ]]; then
	echo "Please run $0 as ROOT"
	exit 1
fi

echo "Runing..."

BORDERLINE=20000 #in Megabytes
DIR="/home"

for name in $(cat /etc/passwd | cut -d: -f1,2 | awk -F: '$2>99{print $1}'); do

	echo -n "User $name exceeds disk quota. Disk usage is:"
			# <- change directories based on the system 
	find $DIR -xdev -user $name -type f -ls | awk '{sum += $7} END {print sum / (1024*1024)}'

done | awk -F: "\$2 > $BORDERLINE {print \$0}"

echo "Done."
exit 0
