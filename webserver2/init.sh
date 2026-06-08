#!/bin/bash

service mariadb start

mysql -u root -p$(echo -n $MYSQL_ROOT_PASSWORD) < /var/www/html/init.sql

apache2ctl -DFOREGROUND
