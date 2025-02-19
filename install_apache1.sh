#! /bin/bash

# Установка Apache
apt install apache2 -y;

# Перенос конфиг файла
cat ./ports.conf > /etc/apache2/ports.conf;

# Перенос сайта
cat ./000-default.conf > /etc/apache2/sites-enabled/000-default.conf;

# Перенос страниц сайтов
cp -rf ./html /var/www/;

cp -rf ./html1 /var/www/;

echo "Конфиг файлы перенесены";

# Запуск Apache
systemctl start apache2; systemctl enable apache2; systemctl restart apache2;

echo "Apache установлен и запущен"

