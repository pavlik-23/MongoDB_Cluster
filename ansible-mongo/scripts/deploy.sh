#!/bin/bash

echo "Running Ansible playbook..."

ansible-playbook -i nventory.yml playbook/mongo_deploy.yaml
