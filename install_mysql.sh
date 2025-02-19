#! /bin/bash

#Установка SQL
apt install mysql-server-8.0 -y;

#Запускаем скрипт безопасности  (готовый файл с скриптом)
./mysql_secure.sh;

# Запускаем SQL
systemctl start mysql;

# Переносим конфиг файл
cat ./mysqld.conf > /etc/mysql/mysql.conf.d/mysqld.cnf;

# Создаем пользователя для реплики
mysql --user=root --password=Testpass1$ --skip-column-names -e "CREATE USER repl@'%' IDENTIFIED WITH 'caching_sha2_password' BY 'oTUSlave#2020'";
mysql --user=root --password=Testpass1$ --skip-column-names -e "GRANT REPLICATION SLAVE ON *.* TO repl@'%'";

# Перезапустить SQL
systemctl restart mysql;
