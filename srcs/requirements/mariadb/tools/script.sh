#!/bin/sh

cd /etc/mysql/mariadb.conf.d/

sed 's/127.0.0.1/0.0.0.0/g' 50-server.cnf

service mysql start