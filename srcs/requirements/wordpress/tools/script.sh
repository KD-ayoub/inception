#!/bin/bash

# sleep 6
mkdir /var/www
mkdir /var/www/html

#echo "<?php phpinfo(); ?>" > /var/www/html/index.php

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
apt-get update && apt-get install -y curl
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core download --path=/var/www/html --allow-root 

wp config create --path=/var/www/html --dbname=$db_name --dbuser=$db_user --dbpass=$db_pass --dbhost=mariadb --allow-root --skip-check
wp core install --url=akadi.1337.ma --title=mywebsite --admin_user=coder --admin_password=1234 --admin_email=ayoubsz200@gmail.com --allow-root
wp user create ayoub oui@oui.monsieur --role=author --user_pass=1234 --allow-root
mkdir /run/php
/usr/sbin/php-fpm7.3 -F
#php7.3-fpm --nodaemonize
#tail -f /dev/random