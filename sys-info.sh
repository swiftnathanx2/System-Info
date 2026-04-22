#!/bin/bash
current_user=$(whoami)
host_name=$(hostname)
current_date=$(date +%Y-%m-%d_%H:%M:%S)
up_time=$(uptime -p)
memory_usage=$(free -m | awk '/Mem:/ {print "Total: ", $2, "MB Used:", $3 " MB Free:", $4 " MB"}')
disk_usage=$(df -BG / | awk 'NR==2 {print "Total: "$2"B", "Used: "$3"B" , "Free: "$4"B"}')
process_count=$(ps aux --no-headers | wc -l)
heavy_memuse=$(ps -eo pid,pmem,pcpu,comm --sort=-pmem | head -n 6)

echo -e "\n===============SYSTEM INFO===========\n"
echo -e "\nUser: $current_user, Host: $host_name\n"
echo -e "\nDate: $current_date\n"
echo -e "\n--------Uptime---------\n"
echo "$up_time"
echo -e "\n----------Memory (MB)---------\n"
echo "$memory_usage"
echo -e "\n-----------Disk Usage-----------\n"
echo -e "\n$disk_usage\n"
echo -e "\n-----------Processes------\n"
echo -e "\nRunning: $process_count\n"
echo -e "\n------Top 5 by Memory-----\n"
echo  "$heavy_memuse"
