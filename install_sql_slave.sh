#! /bin/bash

#Установка SQL
apt install mysql-server-8.0 -y;

#Запускаем скрипт безопасности  (готовый файл с скриптом)
./mysql_secure;

# Запускаем SQL
systemctl start mysql;

# Переносим конфиг файл
cat ./mysqld.cnf > /etc/mysql/mysql.conf.d/mysqld.cnf;

# Перезапустить SQL
systemctl restart mysql;

echo "MySQL установлен";

# Настройка и запуск репликации
MYSQL='mysql --user=root --password=Testpass1$ --skip-column-names -e'

$MYSQL "STOP REPLICA";
$MYSQL "CHANGE REPLICATION SOURCE TO SOURCE_HOST='192.168.42.190', SOURCE_USER='repl', SOURCE_PASSWORD='oTUSlave#2020', SOURCE_AUTO_POSITION = 1, GET_SOURCE_PUBLIC_KEY = 1";
$MYSQL "START REPLICA";

echo "Реплика запущена"
