#!/bin/bash
current_user=$(whoami)
host_name=$(hostname)
current_date=$(date +%Y-%m-%d_%H:%M:%S)
up_time=$(uptime -p)
memory_usage=$(free -m | awk '/Mem:/ {print "Total: ", $2, "MB Used: ", $3 "MB Free: ", $4 "MB"}')
disk_usage=$(df -BG / | awk 'NR==2 {print "Total: "$2, "Used: "$3 , "Free: "$4}')
process_count=$(ps aux --no-headers | wc -l)
heavy_memuse=$(ps -eo pid,pmem,pcpu,comm --sort=-pmem | head -n 6)