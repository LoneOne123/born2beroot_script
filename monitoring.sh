#!/bin/bash
architecture=$(uname -a)
physical_cpu=$(lscpu | grep "CPU(s):" | egrep -o '[0-9.]+')
virtual_cpu=$(nproc)
used_ram=$(free -m | awk 'FNR == 2 {print $3}')
free_ram=$(free -m | awk 'FNR == 2 {print $4}')
used_disk=$(df -h | grep drvfs | awk '{print $3}' | egrep -o '[0-9.]+')
all_disk=$(df -h | grep drvfs | awk '{print $2}' | egrep -o '[0-9.]+')
perc_disk=$(df -h | grep drvfs | awk '{print $5}')
tcp_connections=$(ss -s | awk 'FNR == 2 {print $4}' | egrep -o '[0-9.]+')
ip_adress=$(hostname -I)
mac_adress=$(ip link show | grep link/ether | awk '{print $2}')
echo "#Architecture: $architecture
#CPU physical: $physical_cpu
#vCPU: $virtual_cpu
#Memory Usage: $used_ram/$free_ram MB
#Disk Usage: $used_disk/$all_disk GB ($perc_disk)
#CPU load: TODO
#Last boot: TODO
#LVM use: TODO
#Connections TCP: $tcp_connections ESTABLISHED
#User log: TODO
#NETWORK: IP $ip_adress ($mac_adress)
#Sudo: TODO"
