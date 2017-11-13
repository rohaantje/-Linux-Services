#!/bin/bash 

echo "date.timezone = Europe/Amsterdam" >> /etc/php/7.0/apache2/php.ini 

mysql -u root -p root
create database cacti;
grant all on cacti.* to 'root'@'localhost' identified by 'root';
flush privileges;
exit

mysql -u root -p mysql < /usr/share/mysql/mysql_test_data_timezone.sql 
mysql -u root -p -e 'grant select on mysql.time_zone_name to cactiuser@localhost'

systemctl restart mysql apache2