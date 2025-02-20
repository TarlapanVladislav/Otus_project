# sudo apt install default-jdk -y;

# dpkg -i *.deb;


# Конфигурация ES (поправить cluster.initial_master_nodes: )
cat ./elasticsearch.yml > /etc/elasticsearch/elasticsearch.yml;

# Старт сервиса
sudo systemctl daemon-reload; sudo systemctl enable --now elasticsearch.service;

# Старт kibana
sudo systemctl daemon-reload; sudo systemctl enable --now kibana.service;

cat ./kibana.yml > /etc/kibana/kibana.yml;

systemctl restart kibana;

# Старт logstash
systemctl enable --now logstash.service;

cat ./logstash.yml > /etc/logstash/logstash.yml;

# Добавление конфига Nginx
cat ./logstash-nginx-es.conf > /etc/logstash/conf.d/logstash-nginx-es.conf;

# Перезагрузка logstash
systemctl restart logstash.service
