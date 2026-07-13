#!/bin/bash

echo 'Settings default policies'
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP #ACCEPT


echo 'Accept on localhost'
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

echo 'Allow established sessions to receive traffic'
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

for port in "$@"
do
    echo "Allow port $port"
    iptables -I OUTPUT -p tcp --dport "$port" -j ACCEPT
done

echo 'Graceful exit'
exit 0