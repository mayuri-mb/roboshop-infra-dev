#!/bin/bash

component=$1              #receiving component from bootstrap.sh 
environment=$2
echo "Installing Ansible..."
dnf install ansible -y

echo "Ansible installation complete"
ansible --version

cd /home/ec2-user
if [ ! -d "ansible-roboshop-roles-tf" ]; then
    git clone https://github.com/mayuri-mb/ansible-roboshop-roles-tf.git
fi
git pull

cd ansible-roboshop-roles-tf
ansible-playbook -e component=$component -e environment=$environment roboshop.yaml
