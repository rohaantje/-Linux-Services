#!/bin/bash

echo -e "##Installing syslog-ng##"
logger installing syslog
wget -qO - http://download.opensuse.org/repositories/home:/laszlo_budai:/syslog-ng/xUbuntu_17.04/Release.key | sudo apt-key add -
deb http://download.opensuse.org/repositories/home:/laszlo_budai:/syslog-ng/xUbuntu_16.10 ./
sudo apt install syslog-ng-core

echo -e "##setting syslog conf file##"
logger setting syslog conf file
mv /etc/syslog-ng/syslog-ng.conf /etc/syslog-ng/syslog-ng.conf.bak
cp syslog-ng.conf /etc/syslog-ng/syslog-ng.conf