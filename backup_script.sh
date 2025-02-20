#! /bin/bash

MYSQL='mysql --user=root --password=Testpass1$ --skip-column-names'

DIR='/mnt/'

for s in mysql `$MYSQL -e "SHOW DATABASES LIKE '%%'"`;
        do
        TABLES=`$MYSQL -N -e "SHOW TABLES FROM $s"`;
                for TABLE in $TABLES
                do
        mkdir -p $DIR/$s;
        mysqldump --user=root --password=Testpass1$ --add-drop-table --add-locks --create-options --disable-keys --extended-insert --single-transaction --set-gtid-purged --quick --set-charset --events --routines --triggers $s $TABLE | gzip -1 > $DIR/$s/$TABLE.gz;
                done
        done
