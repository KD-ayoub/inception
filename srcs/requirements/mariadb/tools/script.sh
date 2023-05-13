#!/bin/bash

service mysql start

echo "create database khe_dmi default character set utf8 collate utf8_unicode_ci;" > mysql_conf
echo "create user 'khe_dmi'@'%' identified by 'khe_dmi';" >> mysql_conf
echo "grant all privileges on khe_dmi.* TO 'khe_dmi'@'%';" >> mysql_conf
echo "flush privileges;" >> mysql_conf

#working just fine
#echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" > mysql_conf
##set root with the password 1234
#echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_PW';" >> mysql_conf
##echo "ALTER USER 'root'@'%' IDENTIFIED BY '$DB_PW';" >> mysql_conf
##Creates a user named younes with the password 1234 and grants them access from any host
#echo "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PW';" >>  mysql_conf
##Grants all privileges on the word_db database to the younes use
#echo "GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%';" >> mysql_conf
##reloads the privileges from the grant tables in the MySQL database
#echo "FLUSH PRIVILEGES;" >> mysql_conf

#cat < mysql_conf

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

#bash
mysql < mysql_conf

kill `cat /var/run/mysqld/mysqld.pid`

mysqld_safe



# #!/bin/sh

# #cd /etc/mysql/mariadb.conf.d/

# sed 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# service mysql start
# # echo "create database $db_name default character set utf8 collate utf8_unicode_ci;" > mysql_conf
# # echo "create user '$db_user'@'%' identified by '$db_pass';" >> mysql_conf
# # echo "grant all privileges on $db_name.* TO '$db_user'@'%';" >> mysql_conf
# # echo "flush privileges;" >> mysql_conf



# echo "CREATE DATABASE IF NOT EXISTS $db_name;" > mysql_conf
# #set root with the password 1234
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$db_pass';" >> mysql_conf
# #echo "ALTER USER 'root'@'%' IDENTIFIED BY '$DB_PW';" >> mysql_conf
# #Creates a user named younes with the password 1234 and grants them access from any host
# echo "CREATE USER '$db_user'@'%' IDENTIFIED BY '$db_pass';" >>  mysql_conf
# #Grants all privileges on the word_db database to the younes use
# echo "GRANT ALL ON $db_name.* TO '$db_user'@'%';" >> mysql_conf
# #reloads the privileges from the grant tables in the MySQL database
# echo "FLUSH PRIVILEGES;" >> mysql_conf

# # echo "CREATE DATABASE IF NOT EXISTS $db_name;" > DB.sql
# # echo "CREATE USER '$db_user'@'%' IDENTIFIED BY '$db_pass';" >> DB.sql
# # echo "GRANT ALL PRIVILEGES ON $db_name.* TO $db_user@'%';" >> DB.sql
# # echo "FLUSH PRIVILEGES;" >> DB.sql

# mysql < mysql_conf

# kill `cat /var/run/mysqld/mysqld.pid`

# mysqld_safe