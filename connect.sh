#!/bin/bash
# Install Required Packages
sudo apt update
sudo apt install sssd -y

# Copy Template Config and set permissions
sudo cp ./sssd.conf /etc/sssd/
sudo chown root:root /etc/sssd/sssd.conf
sudo chmod 600 /etc/sssd/sssd.conf

# Restart Service
sudo systemctl restart sssd

# Set option to create Home Dir's for LDAP Users
sudo su -c 'echo "session optional  pam_mkhomedir.so skel=/etc/skel umask=077" >> /etc/pam.d/common-session'


# User Specific Config
sudo usermod -aG sudo ryan
su ryan -c "ssh-import-id-gh ryanvanmass"