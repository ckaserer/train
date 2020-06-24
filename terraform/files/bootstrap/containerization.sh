#!/bin/bash

yum update -y
yum install -y epel-release
yum install -y ansible

ansible-galaxy install gepardec.basics 
ansible-galaxy install geerlingguy.docker 

cat << EOF > /tmp/playbook.yml
---
- hosts: localhost
  become: true
  tasks:
    - include_role:
        name: gepardec.basics
      vars:
        basics_users:
          - centos
        basics_bashrc: true
    - include_role:
        name: geerlingguy.docker
      vars: 
        docker_users:
          - centos
...
EOF

ansible-playbook /tmp/playbook.yml >/tmp/playbook.out 2>&1