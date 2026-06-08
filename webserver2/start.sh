#!/bin/sh

if [ -z "$1" ]; then
    MYSQL_PASSWORD=my-secret-password
else
    MYSQL_PASSWORD=$1
fi

docker build -t webserver .

docker run --rm --name webserver -e MYSQL_ROOT_PASSWORD=$MYSQL_PASSWORD -v data:/var/lib/mysql -p8000:80 webserver:latest
