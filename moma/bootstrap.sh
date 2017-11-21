#!/bin/bash 

sudo su

echo -e "##Setting hostname in hosts file##"
logger setting hostname in hosts file
sed -i '/localhost/a 127.0.1.1 '$(hostname)'' /etc/hosts

echo -e "##clone git and enter dir##"
logger clone git and enter dir
git clone https://github.com/rohaantje/-Linux-Services.git
cd ./-Linux-Services/
mv state /srv/salt/
cd moma

echo -e "##running install scripts##"
logger running install scripts
bash syslog.sh
bash amp.sh
bash mon.sh
bash salt.sh