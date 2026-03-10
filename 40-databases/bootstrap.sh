#!/bin/bash

echo "Installing Ansible..."
dnf install ansible -y

echo "Ansible installation complete"
ansible --version
