# Otus_project

Подготовка:
1. Прописать на всех машинах apt update
2. Добавить репозиторий
   # ssh-keygen; cat ~/.ssh/id_rsa.pub
   # git clone https://github.com/TarlapanVladislav/Otus_project.git

   for branch in $(git branch -r | grep -vE "HEAD|main"); do
  git checkout --track $branch
done

4. Установить заранее Prometheus и Grafana; ELK

ELK поменять имя сервера в конфиг файле elasticksearch, поменять Ip в filebeat

Nginx и Apache поменять Ip в конфиг файлах сайтов

