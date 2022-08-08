#!/bin/bash

sudo apt install gawk
sudo apt install whois

sudo tail -n0 -f /var/webserver_monitor/unauthorized.log | grep "error\|invalid\|Invalid user" > /var/webserver_monitor/newenteries.log
for i in $(sudo cat /var/webserver_monitor/newenteries.log | gawk  '{match($0,/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/,a);split(a[0],b,".")} b[1]<=255&& b[2]<=255 && b[3]<=255 && b[4]<=255 &&length(a[0]){print $1,$2, a[0]}'); do echo "$i $(whois $i | grep -m1 country | gawk '{print $1 $2}')"; done >> updateunauthroized.log

