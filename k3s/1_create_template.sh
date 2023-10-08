#! /bin/bash
## configure template
# - adds ssh key
# - disables root password
# - updates firewall to allow kubectl
set -e

export IP={node_ip}
# copy ssh key
ssh-copy-id -i $HOME/.ssh/wte.pub root@$IP

# disable password login
ssh root@$IP
sed -i -E 's/#?PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
grep -F -w "PasswordAuthentication" /etc/ssh/sshd_config
service sshd restart

# open firewall
systemctl disable firewalld --now

# bypass hang on shutdown
reboot