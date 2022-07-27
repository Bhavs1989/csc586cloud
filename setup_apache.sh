#!/bin/bash
set -x

sudo apt update
sudo apt install -y apache2
sudo apt install -y nfs-kernel-server

prefixForIP = "192.168.1."
link = request.LAN("lan")



