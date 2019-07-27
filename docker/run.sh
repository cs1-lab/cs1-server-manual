#!/bin/bash

# add permisstion to local data.
sudo chown -R 1000 ./data
# add permission to local docker to this user.
sudo setfacl -m user:$USER:rw /var/run/docker.sock
# execute docker-compose
sudo docker-compose up
