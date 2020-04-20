#!/bin/bash

yum update -y
yum install -y epel-release
yum install -y ansible

ansible-galaxy install gepardec.docker

cat << EOF > /tmp/playbook.yml
---
- hosts: localhost
  become: true
  tasks:
    - include_role:
        name: gepardec.docker
      vars: 
        docker_users:
          - centos
...
EOF

ansible-playbook /tmp/playbook.yml 