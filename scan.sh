#!/bin/bash
sudo apt install gawk
sudo apt install whois

ls /var/log
for i in $(sudo cat /var/log/auth.log | grep "error\|invalid\|Invalid user" | gawk  '{match($0,/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/,a);split(a[0],b,".")} b[1]<=255&& b[2]<=255 && b[3]<=255 && b[4]<=255 &&length(a[0]){print $1,$2, a[0]}'); do echo "$i $(whois $i | grep -m1 country | gawk '{print $1 $2}')"; done | column -t > /var/webserver_log/unauthorized.log
