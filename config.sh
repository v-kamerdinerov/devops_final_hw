#!/bin/bash
sudo apt update && sudo apt install -y python python3-pip
sudo pip3 install ansible --upgrade
#sudo apt install software-properties-common
#sudo apt-add-repository --yes --update ppa:ansible/ansible
#sudo apt update
#sudo apt upgrade
#sudo apt install ansible -y
sudo usermod -aG docker ubuntu




