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
wp core install --path=/var/www/html --url=$wp_url --title=$wp_title --admin_user=$wp_admin_user --admin_password=$wp_admin_pass --admin_email=$wp_admin_email --allow-root
wp user create $wp_user $wp_user_email  --path=/var/www/html --role=author --user_pass=$wp_user_pass --allow-root
mkdir /run/php
/usr/sbin/php-fpm7.3 -F
#php7.3-fpm --nodaemonize
#tail -f /dev/random