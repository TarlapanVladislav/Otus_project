#! /bin/bash

MYSQL='mysql --user=root --password=Testpass1$'

echo "Введите имя для создания базы данных:"
read db

$MYSQL -e "CREATE DATABASE $db";

for file in *.gz; do
    gunzip "$file"
    $MYSQL $db < "${file%.gz}"
done
