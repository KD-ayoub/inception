#!/bin/bash

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $db_name;" > DB.sql
echo "CREATE USER '$db_user'@'%' IDENTIFIED BY '$db_pass';" >> DB.sql
echo "GRANT ALL PRIVILEGES ON $db_name.* TO $db_user@'%';" >> DB.sql
echo "FLUSH PRIVILEGES;" >> DB.sql

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

#bash
mysql < DB.sql

kill `cat /var/run/mysqld/mysqld.pid`

mysqld_safe
