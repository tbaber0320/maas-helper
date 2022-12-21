#!/bin/bash
echo  📦 - Installing docker dependencies...

# Update package index
sudo apt-get -qq update

sudo apt-get install -qq ca-certificates > /dev/null
sudo apt-get install -qq curl > /dev/null
sudo apt-get install -qq gnupg > /dev/null
sudo apt-get install -qq lsb-release > /dev/null
sudo apt-get install -qq software-properties-common > /dev/null

echo  🔐 - Adding docker official GPG key...

# Add Docker's official GPG key

sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo  🐳 - Adding stable docker repo...

# Set up the stable Docker repository

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package index

sudo apt-get -qq update 

# Install the latest version of Docker CE

echo  📦 - Installing Docker Engine, ContainerD, Docker Compose...

sudo apt-get install -qq docker-ce > /dev/null
sudo apt-get install -qq containerd.io > /dev/null
sudo apt-get install -qq docker-ce-cli > /dev/null
sudo apt-get install -qq docker-compose-plugin > /dev/null

echo  🤝 - Adding current user to docker group...

# Add the current user to the docker group

usermod -aG docker $USER

# Install the PostgreSQL server and client packages

echo  🛠️ - Installing stable postgresql...

sudo apt-get install -y -qq postgresql > /dev/null

echo  🫰 - Installing snapd

sudo apt-get install -y -qq snapd > /dev/null

# install maas 3.2 via snap

echo  📦 - Installing maas from snap:maas/3.2...

sudo snap install maas

echo  🔍 - List platform version

echo docker | docker --version
echo postgres | psql --version
echo maas | snap info maas | grep installed