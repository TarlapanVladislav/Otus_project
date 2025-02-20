#! /bin/bash

cat ./filebeat.yml > /etc/filebeat/filebeat.yml;

systemctl restart filebeat;

sudo filebeat modules enable nginx;
