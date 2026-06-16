#!/bin/bash

# This script will be run on the worker nodes to join the Docker Swarm cluster
if [ -f /vagrant/worker_join_command.sh ]; then
    source /vagrant/worker_join_command.sh
else
    echo "Worker join command not found. Please ensure the manager node has generated the command."
    exit 1
fi  

