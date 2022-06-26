#!/bin/bash
export COLOR="[31;43m" ; export COLOR_END="[0m"

# This script will return the following set of system information:
# -Hostname information:
echo -e "\e$COLOR***** HOSTNAME INFORMATION *****\e$COLOR_END"
hostnamectl
echo ""
# -File system disk space usage:
echo -e "\e$COLOR***** FILE SYSTEM DISK SPACE USAGE *****\e$COLOR_END"
df -h
echo ""
# -Free and used memory in the system:
echo -e "\e$COLOR ***** FREE AND USED MEMORY *****\e$COLOR_END"
free
echo ""
# -System uptime and load:
echo -e "\e$COLOR***** SYSTEM UPTIME AND LOAD *****\e$COLOR_END"
uptime
echo ""
# -Logged-in users:
echo -e "\e$COLOR***** CURRENTLY LOGGED-IN USERS *****\e$COLOR_END"
who
echo ""
# -Top 5 processes as far as memory usage is concerned
echo -e "\e$COLOR***** TOP 5 MEMORY-CONSUMING PROCESSES *****\e$COLOR_END"
ps -Ao %mem,%cpu,command --sort=-%mem | head -n 6
echo ""
echo -e "\e[1;32mDone.\e[0m"
