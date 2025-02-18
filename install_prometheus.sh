#! /bin/bash

apt update -y;

apt install prometheus -y;

echo ./prometheus.yml > /etc/prometheus/prometheus.yml;

systemctl daemon-reload; systemctl start prometheus; systemctl enable prometheus;

sudo dpkg -i grafana_11.5.1_amd64.deb;

systemctl daemon-reload; systemctl start grafana-server;

echo "графана и прометеус установлены и запущены"

