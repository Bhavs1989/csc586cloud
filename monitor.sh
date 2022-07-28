#!/bin/bash

sudo tail -f /var/webserver_monitor/unauthorized.log

crontab -e
MAILTO=bp96693@wcupa.edu

