#!/bin/bash

# Установка пароля для root пользователя
MYSQL_ROOT_PASSWORD="Testpass1$"

# Автоматизация mysql_secure_installation
mysql --user=root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED WITH 'caching_sha2_password' BY '${MYSQL_ROOT_PASSWORD}';
# Удаление анонимных пользователей
DELETE FROM mysql.user WHERE User='';
# Отключение удаленного доступа root
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
# Удаление тестовой базы данных
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
# Применение изменений
FLUSH PRIVILEGES;
EOF

echo "MySQL secure installation completed."
