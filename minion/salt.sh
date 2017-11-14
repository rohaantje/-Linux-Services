#!/bin/bash


echo -e "##Installing SaltStack##"
logger installing saltstack
wget -O bootstrap-salt.sh https://bootstrap.saltstack.com
sudo sh bootstrap-salt.sh

echo -e "##set master ip##"
logger set master ip
sed -i "s/#master: salt/master: 10.4.1.25/g"  /etc/salt/minion

echo -e "##starting service##"
logger starting services
service salt-minion restart

