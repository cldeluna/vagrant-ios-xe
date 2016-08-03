#!/bin/bash

apt-get update -y
apt-get upgrade -y
apt-get install -y nano
apt-get install -y git
apt-get install -y tree
sudo apt-get update
sudo apt-get install software-properties-common
#Once the package is installed, we can add the Ansible PPA by typing the following command:
sudo apt-add-repository -y ppa:ansible/ansible

#Next, we need to refresh our system's package index so that it is aware of the packages available in the PPA. Afterwards, we can install the software:

sudo apt-get update -y
sudo apt-get install -y ansible
