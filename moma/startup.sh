#!/bin/bash 

echo -e "##Setting hostname in hosts file##"
logger setting hostname in hosts file
sed -i '/localhost/a 127.0.1.1 ruben-test' /etc/hosts

bash amp.sh
bash salt.sh
bash mon.sh