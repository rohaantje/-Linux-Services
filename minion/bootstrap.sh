#!/bin/bash 

sudo su

echo -e "##Setting hostname in hosts file##"
logger setting hostname in hosts file
sed -i '/localhost/a 127.0.1.1 '$(hostname)'' /etc/hosts

echo -e "##clone git and enter dir##"
logger clone git and enter dir
cd /home/
git clone https://github.com/rohaantje/-Linux-Services.git
cd ./-Linux-Services/
rm -rf /moma
rm -rf /state
cd minion

echo -e "##running install scripts##"
logger running install scripts
bash salt.sh

echo -e "##Installation Complete, Server Ready##"
logger installation complete, Server Ready