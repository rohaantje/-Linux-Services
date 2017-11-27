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

wordpress_db:
  mysql_user.present:
    - connection_user: root
    - connection_pass: ''
    - name: wordpress
    - password: password
  mysql_database.present:
    - connection_user: root
    - connection_pass: ''
    - name: wordpress
  mysql_grants.present:
    - connection_user: root
    - connection_pass: ''
    - database: wordpress.*
    - grant: ALL PRIVILEGES
    - user: wordpress

get_wordpress:
  cmd.run:
    - name: 'wget http://wordpress.org/latest.tar.gz && tar xvzf latest.tar.gz'
    - cwd: /var/www/html/

#Set ownership of WP dir to current user
/var/www/html:
  file.directory:
    - user: www-data
    - group: www-data
    - mode: 777 # some permission
    - recurse:
      - user
      - group

apache2:
  service.running:
    - enable: True
    - reload: True
    - watch:
      - file: /var/www/html