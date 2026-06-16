#!/bin/bash

# This script will be run on the manager node to initialize the Docker Swarm node and generate the worker join command
docker swarm init --advertise-addr 192.168.56.11 
echo "#!/bin/bash" > /vagrant/worker_join_command.sh
docker swarm join-token worker | grep  "docker swarm join" >> /vagrant/worker_join_command.sh
chmod +x /vagrant/worker_join_command.sh

