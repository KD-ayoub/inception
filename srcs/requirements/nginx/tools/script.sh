#!/bin/sh

apt-get install vim -y
apt-get install php php-fpm -y 

service php7.3-fpm start

echo "***************************************"
ls /run/php/

service php7.3-fpm status
nginx -g "daemon off;"
# nginx 