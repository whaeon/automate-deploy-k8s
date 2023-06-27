#!/bin/bash

host_ip=$(ip a s $4 | grep "inet " | awk -F " " '{print $2}' | awk -F "/" '{print $1}')
repeat_ip=$(cat /etc/haproxy/haproxy.cfg | grep "kube-apiserver-1" | awk -F " " '{print $3}' | awk -F ":" '{print $1}')

if [ $host_ip == $1 ];then
    sed -i "s/BACKUP/MASTER/" /etc/keepalived/keepalived.conf
    sed -i "s/priority 100/priority 104/" /etc/keepalived/keepalived.conf
fi

if [ $repeat_ip != $1 ];then
    sed -i "s/eth0/$4/" /etc/keepalived/keepalived.conf
    sed -i "s/172.16.0.2/$host_ip/" /etc/keepalived/keepalived.conf
    sed -i "s/172.16.0.4/$1/" /etc/keepalived/keepalived.conf
    sed -i "s/172.16.0.5/$2/" /etc/keepalived/keepalived.conf
    sed -i "s/172.16.0.6/$3/" /etc/keepalived/keepalived.conf
    sed -i "s/172.16.0.10/$5/" /etc/keepalived/keepalived.conf

    sed -i "s/172.16.0.4/$1/" /etc/haproxy/haproxy.cfg
    sed -i "s/172.16.0.5/$2/" /etc/haproxy/haproxy.cfg
    sed -i "s/172.16.0.6/$3/" /etc/haproxy/haproxy.cfg
fi