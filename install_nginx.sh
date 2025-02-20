#! /bin/bash

apt install nginx -y;

cat ./default > /etc/nginx/sites-enabled/default

systemctl restart nginx;


echo "Nginx установлен и запущен";

# Настройка filebeat.yml
cat ./filebeat.yml > /etc/filebeat/filebeat.yml;

systemctl restart filebeat;

echo "filebeat настроен";

apt install prometheus-node-exporter -y;

systemctl daemon-reload; systemctl start prometheus-node-exporter; systemctl enable prometheus-node-exporter;

echo "node_exporter установлен и запущен"


