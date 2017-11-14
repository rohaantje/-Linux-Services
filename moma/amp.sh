#!/bin/bash

echo -e "##Installing apache2##"
logger installing apache2
sudo apt -y install apache2

echo -e "##Installing PHP5##"
logger installing PHP5
sudo apt -y install libapache2-mod-php5 php5 php5-common php5-curl php5-dev php5-gd php5-idn php-pear php5-imagick php5-mcrypt php5-mysql php5-ps php5-pspell php5-recode php5-xsl

echo -e "##Installing PHP7##"
logger installing PHP7
sudo apt -y install php7.0 php7.0-cli php7.0-snmp php7.0-xml php7.0-mbstring php7.0-json php7.0-gd php7.0-gmp php7.0-zip php7.0-ldap php7.0-mcrypt

echo -e "##Installing MySQL##"
logger installing MySQL
echo 'mysql-server mysql-server/root_password password root' | sudo debconf-set-selections
echo 'mysql-server mysql-server/root_password_again password root' | sudo debconf-set-selections
sudo apt -y install mysql-server php7.0-mysql

echo -e "##restart apache2##"
logger restart apache2
/etc/init.d/apache2 restart