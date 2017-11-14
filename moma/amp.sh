#!/bin/bash

echo -e "##Installing apache2##"
logger installing apache2
sudo apt -y install apache2

echo -e "##Installing PHP5##"
logger installing PHP5
sudo apt -y install php5.6 php5.6-gd php5.6-cli

echo -e "##Installing MySQL##"
logger installing MySQL
echo 'mysql-server mysql-server/root_password password root' | sudo debconf-set-selections
echo 'mysql-server mysql-server/root_password_again password root' | sudo debconf-set-selections
sudo apt -y install mysql-server php5.6-mysql

echo -e "##restart apache2##"
logger restart apache2
/etc/init.d/apache2 restart