#!/bin/bash
sudo -i
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -F

exit

