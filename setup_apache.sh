#!/bin/bash
set -x

sudo apt update
sudo apt install -y apache2
sudo apt install -y nfs-kernel-server

sudo systemctl status apache2.service
sudo apachectl configtest

mkdir ~/public_html
sudo a2enmod userdir
sudo systemctl restart apache2

prefixForIP = "192.168.1."
link = request.LAN("lan")

sudo mkdir /var/webserver_log
sudo mount 192.168.1.1:/var/webserver_log var/webserver_monitor/
