#!/bin/bash 
#
# Based on https://forums.cacti.net/viewtopic.php?t=38633

MySQLCactiUser="cacti" 			# MYSQL user for cacti database
MySQLCactiPwd="cacti" 			# Password for the MYSQL user defined above
SystemCactiUser="cacti" 		# Linux user running cacti
MySQLRootPwd="root" 			# Password for MYSQL user "root"
CactiVersion="1.1.27" 			# Cacti version to be installed
SettingsVersion="0.71-1" 			# Settings plugin version to be installed
SyslogVersion="1.22-2"			# Syslog plugin version to be installed

echo -e "##Installing cacti tools##"
logger installing rrdtool snmp snmpd
sudo apt -y install rrdtool snmp snmpd

echo -e "##Installing cacti##"
logger installing cacti
apt-get install rrdtool snmp snmpd php5-snmp -y
cd /usr/src/
wget http://www.cacti.net/downloads/cacti-$CactiVersion.tar.gz
tar zxvf cacti-$CactiVersion.tar.gz
mv ./cacti-$CactiVersion/ /var/www/html/cacti/
mysqladmin -u root -p$MySQLRootPwd create cacti
echo "GRANT ALL ON cacti.* TO $MySQLCactiUser@localhost IDENTIFIED BY '$MySQLCactiPwd';"|mysql -u root -p$MySQLRootPwd mysql
mysql -u $MySQLCactiUser -p$MySQLCactiPwd cacti < /var/www/html/cacti/cacti.sql
cd /var/www/html/cacti/include/
sed -i -e "s/username = 'cactiuser'/username = '"$MySQLCactiUser"'/" config.php
sed -i -e "s/password = 'cactiuser'/password = '"$MySQLCactiPwd"'/" config.phpcd
useradd $SystemCactiUser -g www-data -d /var/www/html/cacti -s /bin/false
chown -R $SystemCactiUser:www-data /var/www/html/cacti/rra/ /var/www/html/cacti/log/
chmod -R 770 /var/www/html/cacti/rra/ /var/www/html/cacti/log/
touch /etc/cron.d/cacti
echo "*/5 * * * * $SystemCactiUser php /var/www/html/cacti/poller.php >/dev/null 2>&1" > /etc/cron.d/cacti
rm -f /usr/src/cacti-$CactiVersion.tar.gz

echo -e "##Installing settings plugins##"
logger installing settings plugings
cd /usr/src/
wget https://docs.cacti.net/_media/plugin:settings-v$SettingsVersion.tgz
mv plugin\:settings-v$SettingsVersion.tgz settings-v$SettingsVersion.tgz
tar zxvf ./settings-v$SettingsVersion.tgz
mv /usr/src/settings/ /var/www/html/cacti/plugins/
rm -f /usr/src/settings-v$SettingsVersion.tgz

echo -e "##Installing syslog plugins##"
logger installing syslog plugings
cd /usr/src/
wget https://docs.cacti.net/_media/plugin:syslog-v$SyslogVersion.tgz
mv plugin\:syslog-v$SyslogVersion.tgz syslog-v$SyslogVersion.tgz
tar zxvf ./syslog-v$SyslogVersion.tgz
mv /usr/src/syslog/ /var/www/html/cacti/plugins/
rm -f /usr/src/syslog-v$SyslogVersion.tgz