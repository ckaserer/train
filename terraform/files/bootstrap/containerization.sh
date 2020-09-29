#!/bin/bash

yum update -y
yum install -y epel-release
yum install -y ansible

ansible-galaxy install ckaserer.bashrc
ansible-galaxy install ckaserer.desktop
ansible-galaxy install ckaserer.keymap
ansible-galaxy install ckaserer.remote_desktop
ansible-galaxy install ckaserer.timezone
ansible-galaxy install ckaserer.users 
ansible-galaxy install geerlingguy.docker 
ansible-galaxy install grog.sudo

cat << EOF > /tmp/playbook.yml
---
- hosts: localhost
  become: true
  tasks:
    - include_role:
        name: ckaserer.bashrc
      vars: 
        systemwide: true
    - include_role:
        name: ckaserer.users
      vars:
        users:
          - centos
    - include_role:
        name: grog.sudo
      vars:
        sudo_list:
          - name: centos
            sudo:
              hosts: ALL
              as: ALL:ALL
              nopasswd: yes
              commands: ALL
    - include_role:
        name: ckaserer.desktop
      vars:
        autologin_user: centos
    - include_role:
        name: ckaserer.keymap
    - include_role:
        name: ckaserer.remote_desktop
    - include_role:
        name: ckaserer.timezone
    - include_role:
        name: geerlingguy.docker
      vars: 
        docker_users:
          - centos
...
EOF

ansible-playbook /tmp/playbook.yml >/tmp/playbook.out 2>&1

cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
exclude=kubelet kubeadm kubectl
EOF

# Set SELinux in permissive mode (effectively disabling it)
sudo setenforce 0
sudo sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

sudo yum install -y jq kubelet kubeadm kubectl --disableexcludes=kubernetes

sudo systemctl enable --now kubelet