#!/bin/bash
sudo apt update && sudo apt install -y maven awscli
git clone https://github.com/v-kamerdinerov/boxfuse.git
cd boxfuse && mvn clean package
