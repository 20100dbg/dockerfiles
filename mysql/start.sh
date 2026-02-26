#!/bin/bash

ROOT_PASSWORD=my-secret-password

docker pull mysql:latest

mkdir -p ./mysql

docker run -d \
  --name mysql_container \
  -e MYSQL_ROOT_PASSWORD=$ROOT_PASSWORD \
  --mount type=bind,src=./mysql,dst=/var/lib/mysql \
  -p 3306:3306 \
  mysql:latest

echo;
echo Container started !
echo Root password is $ROOT_PASSWORD