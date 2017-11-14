#!/bin/bash

echo -e "##Installing apache2##"
logger installing apache2
sudo apt -y install apache2

echo -e "##Installing PHP##"
logger installing PHP
sudo apt -y install libapache2-mod-php php php-gd php-cli php-xml php-ldap php-mbstring

echo -e "##Installing MySQL##"
logger installing MySQL
echo 'mysql-server mysql-server/root_password password root' | sudo debconf-set-selections
echo 'mysql-server mysql-server/root_password_again password root' | sudo debconf-set-selections
sudo apt -y install mysql-server php-mysql

echo -e "##setting timezones##"
logger setting timezones##
sed -i -e "s/\;date.timezone =/date.timezone = Europe\/Amsterdam/g" /etc/php/7.0/apache2/php.ini

echo -e "##restart apache2##"
logger restart apache2
/etc/init.d/apache2 restart