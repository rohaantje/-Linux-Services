mysql_setup:
  debconf.set:
    - name: mysql-server
    - data:
        'mysql-server/root_password': {'type': 'string', 'value': 'root'}
        'mysql-server/root_password_again': {'type': 'string', 'value': 'root'}

mysql-server:
  pkg:
    - installed
    - require:
      - debconf: mysql_setup

lamp:
  pkg.installed:
    - pkgs:
      - php
      - php-pear
      - php-mysql
      - apache2
      - libapache2-mod-php7.0