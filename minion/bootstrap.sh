#!/bin/bash 

echo -e "##Setting hostname in hosts file##"
logger setting hostname in hosts file
sed -i '/localhost/a 127.0.1.1 '$(hostname)'' /etc/hosts
cd ./-Linux-Services/minion/

bash salt.sh