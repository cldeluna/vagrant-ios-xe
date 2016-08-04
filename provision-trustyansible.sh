#!/bin/bash

sudo pt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y nano
sudo apt-get install -y git
sudo apt-get install -y tree
sudo apt-get update
sudo apt-get install software-properties-common
#Once the package is installed, we can add the Ansible PPA by typing the following command:
sudo apt-add-repository -y ppa:ansible/ansible

#Next, we need to refresh our system's package index so that it is aware of the packages available in the PPA. Afterwards, we can install the software:

sudo apt-get update -y
sudo apt-get install -y ansible

# Add a reminder that the Synced Folder is /vagrant
echo "Synced Folder is not in your home directory.  By default Vagrant shares your project directory (the one with the Vagrant file) to the /vagrant directory in your guest machine." > /home/vagrant/Synced_Folder_Location.txt

sudo apt-get -y install python-pip
sudo apt-get -y install wget
