#!/bin/bash
sudo apt update && sudo apt install -y python ansible python-pip
sudo pip install ansible --upgrade
#sudo apt install software-properties-common
#sudo apt-add-repository --yes --update ppa:ansible/ansible
#sudo apt install ansible -y
sudo usermod -aG docker ubuntu



