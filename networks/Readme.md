# Networks

This is a small framework designed to help you working pivot techniques.

Each docker-compose file describes a set of victim Docker containers interconnected by distinct networks. 
To reach the final link, you will need to pivot through each container.

#### Usage

1. Choose a docker-compose file and copy it :
```
cp docker-compose.yml-iptables docker-compose.yml
```

2. Start the network
```
./start.sh
```

The start.sh script does :
- Build the docker images
- Start the containers
- Print each container IP


#### Dump private ssh keys inside ssh_keys folder

```
#!/bin/bash
containers=$(docker ps | grep pivot | awk '{print $NF}' | sort)
mkdir -p ssh_keys

for container in $containers
do
  docker exec $container cat /root/.ssh/id_rsa > ssh_keys/key_$container
done
```
