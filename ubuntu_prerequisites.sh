#!/bin/bash

if ! [ $(id -u) = 0 ]; then
   echo "Must be root!"
   exit 1
fi

apt-get update
#transport
apt-get install apt-transport-https ca-certificates gnupg-agent software-properties-common curl wget rsync tree
#code
apt-get install build-essential git python3 python3-dev python3-pip make gcc
#libs
apt-get install libc6-dev libffi-dev
#docker
#apt-get remove docker docker-engine docker.io containerd runc
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io

#docker compose
if ! [ -f "/usr/local/bin/docker-compose" ]; then
	curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose
fi
docker-compose --version
docker run hello-world

echo Complete!
