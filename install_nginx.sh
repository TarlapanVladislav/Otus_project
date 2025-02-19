#! /bin/bash

apt install nginx -y;

cat ./default > /etc/nginx/sites-enabled/default

systemctl restart nginx;



echo "Nginx установлен и запущен"

