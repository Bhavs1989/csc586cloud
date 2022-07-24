#!/bin/bash
sudo apt install whois

ls /var/log
for i in $(sudo cat /var/log/auth.log | grep "error\|invalid\|closed\|Invalid user" | awk 'match($0, /[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/) {i[substr($0,RSTART,RLENGTH)]=1}END{for(ip in i){printf("%s\n", ip)}}'); do echo "$i $(whois $i | grep -m1 country)"; done | column -t
