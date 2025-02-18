#! /bin/bash

apt update -y;

apt install node_exporter -y;

systemctl daemon-reload; systemctl start node_exporter; systemctl enable node_exporter;

echo "node_exporter установлен и запущен"
