#! /bin/bash

sudo apt-get install -y adduser libfontconfig1 musl;

wget https://dl.grafana.com/oss/release/grafana_11.5.1_amd64.deb;

sudo dpkg -i grafana_11.5.1_amd64.deb;

systemctl daemon-reload; systemctl start grafana-server;

echo "графана установлена и запущена"
