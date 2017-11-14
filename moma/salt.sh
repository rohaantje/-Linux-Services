#!/bin/bash


echo -e "##Installing SaltStack##"
logger installing saltstack
wget -O bootstrap-salt.sh https://bootstrap.saltstack.com
sudo sh bootstrap-salt.sh -M
systemctl start salt-master
service salt-master start