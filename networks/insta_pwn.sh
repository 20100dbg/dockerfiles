#!/bin/bash
containers=$(docker ps | grep pivot | awk '{print $NF}' | sort)

mkdir -p ssh_keys
chain="ssh -D 1080 -J"

for container in $containers
do
  docker exec $container cat /root/.ssh/id_rsa > ssh_keys/key_$container
  chain="$chain root@$(docker exec $container hostname -i | xargs -n1 | sort | head -n 1)"
done

echo 'SSH keys copied in ./ssh_keys !'
echo -n 'Usage: '
echo $chain
