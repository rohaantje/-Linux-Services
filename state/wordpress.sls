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

#Set ownership of WP dir to current user
/var/www/html:
  file.directory:
    - user: ubuntu
    - group: ubuntu
    - mode: 777 # some permission    
    - recurse:
      - user
      - group
