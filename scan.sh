#!/bin/bash

ls /var/log
sudo cat /var/log/auth.log | grep "error\|invalid\|closed\|Invalid user"
