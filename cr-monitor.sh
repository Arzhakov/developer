#!/bin/bash

# CPU & RAM monitor

# v1
# cpu=`bash -c $'top -n 1 | head -n 3 | tail -n 1 | awk \'{print $2 + $4}\''`
# echo HELLO $cpu

# v2
# https://askubuntu.com/questions/941949/one-liner-to-show-cpu-ram-and-hdd-usage
# echo "CPU `LC_ALL=C top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}'`% RAM `free -m | awk '/Mem:/ { printf("%3.1f%%", $3/$2*100) }'` HDD `df -h / | awk '/\// {print $(NF-1)}'`"

# v3
now=`date '+%Y-%m-%d %H:%M:%S'`
echo "$now;`LC_ALL=C top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}'`;`free -m | awk '/Mem:/ { printf("%.0f", $3/$2*100) }'`"






some
new
string

1
2