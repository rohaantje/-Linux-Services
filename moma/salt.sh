#!/bin/bash


echo -e "##Installing SaltStack##"
logger installing saltstack
wget -O bootstrap-salt.sh https://bootstrap.saltstack.com
sudo sh bootstrap-salt.sh -M

echo -e "##auto accept minions##"
logger auto accept minions
sed -i "s/\#auto_accept: False/auto_accept: True/g"  /etc/salt/master

echo -e "##starting service##"
logger starting services
systemctl start salt-master
service salt-master restart