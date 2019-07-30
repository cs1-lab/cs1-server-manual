#!/bin/bash

# add permisstion to local data.
sudo chown -R 1000 ./data
# add permission to local docker to this user.
sudo setfacl -m user:$USER:rw /var/run/docker.sock

sudo docker-compose up
# run as daemon
#sudo docker-compose up -d
