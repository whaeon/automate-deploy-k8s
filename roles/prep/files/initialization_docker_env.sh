#!/bin/bash

# set -x

# delete old docker
sudo apt remove docker docker-engine docker.io

# add docker source
sudo apt update -y
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://mirrors.ustc.edu.cn/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://mirrors.ustc.edu.cn/docker-ce/linux/ubuntu $(lsb_release -cs) stable"

# install docker-ce
sudo apt-get update -y
sudo apt-get install docker-ce -y

# power on machine, and then start docker
sudo systemctl enable docker
sudo systemctl start docker

# add docker to docker group
sudo groupadd docker
sudo usermod -aG docker $1

# install docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# flush user
# echo $1 | su - $2
