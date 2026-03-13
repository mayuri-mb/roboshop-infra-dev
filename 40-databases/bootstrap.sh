#!/bin/bash

component=$1              #receiving component from bootstrap.sh 
env=$2
echo "component=$1, environment=$2"
echo "Installing Ansible..."
dnf install ansible -y

echo "Ansible installation complete"
ansible --version

cd /home/ec2-user

# Remove old folder if exists
rm -rf ansible-roboshop-roles-tf

git clone https://github.com/mayuri-mb/ansible-roboshop-roles-tf.git
git pull

cd ansible-roboshop-roles-tf
ansible-playbook -e component=$component -e env=$environment roboshop.yaml
