#!/bin/sh

cd /etc/mysql/mariadb.conf.d/

sed 's/127.0.0.1/0.0.0.0/g' 50-server.cnf

service mysql start

echo "CREATE DATABASE IF NOT EXISTS my_database;" > DB.sql
echo "CREATE USER 'my_user'@'%' IDENTIFIED BY 'my_pass';" >> DB.sql
echo "GRANT ALL PRIVILEGES ON my_database.* TO my_user@'%';" >> DB.sql
echo "FLUSH PRIVILEGES;" >> DB.sql

mysql < DB.sql

mysqld