#!/bin/bash

docker compose build
docker compose up -d --remove-orphans

containers=$(docker ps | grep pivot | awk '{print $NF}' | sort)

echo;
for container in $containers
do
  echo -n "$container: "
  docker exec $container hostname -i
done

echo;
echo "Log using (password: attacker): ssh attacker@$(docker exec pivot0-attacker hostname -i)"
