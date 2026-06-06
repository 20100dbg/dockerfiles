#!/bin/bash


#docker network inspect networks_network0 | grep IPv4Address
#docker network inspect networks_network1 | grep IPv4Address
#docker network inspect networks_network2 | grep IPv4Address


containers=$(docker ps | awk '{if(NR>1) print $NF}')

for container in $containers
do
  echo -n "$container: "
  docker exec $container "hostname" "-i"
done
