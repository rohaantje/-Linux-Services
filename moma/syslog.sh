#!/bin/bash

echo -e "##Installing syslog-ng##"
logger installing syslog
sudo apt -y install syslog-ng syslog-ng-core

echo -e "##setting syslog conf file##"
logger setting syslog conf file
mv /etc/syslog-ng/syslog-ng.conf /etc/syslog-ng/syslog-ng.conf.bak
cp syslog-ng.conf /etc/syslog-ng/syslog-ng.conf

echo -e "##start syslog service##"
logger start syslog service
service syslog-ng start