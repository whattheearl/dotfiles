#! /bin/bash

set -e

export NODE1="192.168.88.xxx"
export NODE2="192.168.88.xxx"
export NODE3="192.168.88.xxx"

for i in 1 2 3
do
    IP="NODE$i"
    echo configuring NODE$i: ${!IP}
    ssh root@${!IP} -o "StrictHostKeyChecking no" exit

    echo disable firewall
    ssh root@${!IP} systemctl stop firewalld
    ssh root@${!IP} systemctl disable firewalld

    echo setting hostname to NODE$i
    ssh root@${!IP} hostnamectl set-hostname NODE$i.wte.sh
    echo ipv6: disabled
    ssh root@${!IP} nmcli con mod enp6s18 ipv6.method disabled
    echo ipv4: set 192.168.88.1$i/24
    ssh root@${!IP} nmcli con mod enp6s18 ipv4.method manual ipv4.addr 192.168.88.1$i/24 ipv4.gateway 192.168.88.1 ipv4.dns 192.168.88.1
    echo update network
    ssh root@${!IP} nmcli con up enp6s18 > /dev/null
    echo testing network
    ssh root@node$i.wte.sh echo changed ip4
done