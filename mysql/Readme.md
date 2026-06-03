## Start
./start.sh <root_password>

## Populate database
mysql -u root -h 127.0.0.1 -p < sample.sql

## Connect and use
mysql -u root -h 127.0.0.1 -p


## Reset database
docker stop mysql_container
docker rm mysql_container
