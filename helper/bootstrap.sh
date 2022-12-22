#!/bin/bash

# Update package indexes
echo  📦 - Updating packages before proceeding...

# Update package index
sudo apt-get -qq update

# Install postgresql
echo  🛠️ - Installing postgresql...
sudo apt-get install -y -qq postgresql > /dev/null

# Install snapd
echo  🫰 - Installing snapd...
sudo apt-get install -y -qq snapd > /dev/null

# Install maas 3.2 via snap
echo  📦 - Installing maas from snap:maas/3.2...
sudo snap install maas

# Install docker dependencies
echo  📦 - Installing docker dependencies...
sudo apt-get install -qq ca-certificates > /dev/null
sudo apt-get install -qq curl > /dev/null
sudo apt-get install -qq gnupg > /dev/null
sudo apt-get install -qq lsb-release > /dev/null
sudo apt-get install -qq software-properties-common > /dev/null
echo  🔐 - Adding docker GPG key...
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo  🐳 - Adding stable docker repo...
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get -qq update

# Install the latest version of Docker CE
echo  📦 - Installing docker engine, containerd, docker compose...
sudo apt-get install -qq docker-ce > /dev/null
sudo apt-get install -qq containerd.io > /dev/null
sudo apt-get install -qq docker-ce-cli > /dev/null
sudo apt-get install -qq docker-compose-plugin > /dev/null

# Add the current user to the docker group
echo  🤝 - Adding current user to docker group...
sudo usermod -aG docker $USER

echo  ✅ - Success - proceeding with interactive setup