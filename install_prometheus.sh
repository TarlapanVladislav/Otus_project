#! /bin/bash

# Установка prometheus
apt install prometheus -y;

# Копирования конфиг файла
echo ./prometheus.yml > /etc/prometheus/prometheus.yml;

# Запуск prometheus
systemctl daemon-reload; systemctl start prometheus; systemctl enable prometheus;


# Установка Grafana
sudo apt-get install -y adduser libfontconfig1 musl;

wget https://dl.grafana.com/oss/release/grafana_11.5.1_amd64.deb;

sudo dpkg -i grafana_11.5.1_amd64.deb;

# Запуск Grafana
systemctl daemon-reload; systemctl start grafana-server;


echo "Прометеус и Графана установлены и запущены"
