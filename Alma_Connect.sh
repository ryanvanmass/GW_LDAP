#!/bin/bash
### Install Dependancies ###
sudo dnf install openldap-clients sssd -y

# Copy Template Config and set permissions
sudo cp ./sssd.conf /etc/sssd/
sudo chown root:root /etc/sssd/sssd.conf
sudo chmod 600 /etc/sssd/sssd.conf

# Set option to create Home Dir's for LDAP Users
sudo su -c 'echo "session optional  pam_mkhomedir.so skel=/etc/skel umask=077" >> /etc/pam.d/common-session'

# User Specific Config
sudo systemctl restart sssd
sudo mkhomedir_helper ryan
sudo usermod -aG wheel ryan
sudo mkdir /home/ryan/.ssh
sudo wget -O - https://github.com/ryanvanmass.keys >> /home/ryan/.ssh/authorized_keys


