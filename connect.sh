#!/bin/bash
sudo apt update
sudo apt install sssd -y


sudo cp $pwd/sssd.conf /etc/sssd/

sudo chown root:root /etc/sssd/sssd.conf
sudo chmod 600 /etc/sssd/sssd.conf

sudo systemctl restart sssd

sudo usermod -aG sudo ryan
su ryan -c "ssh-import-id-gh ryanvanmass"