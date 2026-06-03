#!/bin/bash

if [ -z "$1" ]; then
    ROOT_PASSWORD=my-secret-password
else
    ROOT_PASSWORD=$1
fi

docker pull mysql:latest

docker run -d \
  --rm --name mysql_container \
  -e MYSQL_ROOT_PASSWORD=$ROOT_PASSWORD \
  --mount type=volume,dst=/var/lib/mysql \
  -p 3306:3306 \
  mysql:latest

echo;
echo Container started !
echo Root password is $ROOT_PASSWORD
