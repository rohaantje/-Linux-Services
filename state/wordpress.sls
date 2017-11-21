# This block creates the wordpress database, user and sets user access. 
wordpress_db:
  mysql_database.present:
    - name: wordpress
  mysql_user.present:
    - name: wordpress
    - password: password
  mysql_grants.present:
    - database: wordpress.*
    - grant: ALL PRIVILEGES
    - user: wordpress
    - host: '%'

#Installs other dependancies
php:
  pkg.installed:
    - pkgs:
      - php-curl
      - php-gd
      - php-mbstring
      - php-mcrypt
      - php-xml
      - php-xmlrpc

apache2:
  service.running:
    - enable: True
    - reload: True

get_wordpress:
  cmd.run:
    - name: 'wget http://wordpress.org/latest.tar.gz && tar xvzf latest.tar.gz'
    - cwd: /var/www/html/

get_wp-cli:
  cmd.run:
    - name: 'curl -sS https://raw.github.com/wp-cli/wp-cli.github.com/master/installer.sh | bash'
    - cwd: /home/vagrant/
    - user: vagrant

/usr/local/bin/wp:
  file:
    - symlink
    - target: /home/vagrant/.wp-cli/bin/wp

config_wordpress:
  cmd.run:
    - cwd: /var/www/html/wordpress/
    - name: '/usr/local/bin/wp core config --dbname=wordpress --dbuser=wordpress --dbpass=password'

install_wordpress:
  cmd.run:
    - cwd: /var/www/html/wordpress/
    - name: '/usr/local/bin/wp core install --url=http://145.37.234.141/wordpress --title=development --admin_user=admin --admin_password=password --admin_email=root@localhost' 

#Set ownership of WP dir to current user
/var/www/html:
  file.directory:
    - user: ubuntu
    - group: ubuntu
    - mode: 777 # some permission    
    - recurse:
      - user
      - group
