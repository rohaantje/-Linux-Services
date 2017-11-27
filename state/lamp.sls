lamp:
  pkg.installed:
    - pkgs:
      - mysql-server
      - php
      - php-pear
      - php-mysql
      - apache2
      - libapache2-mod-php7.0