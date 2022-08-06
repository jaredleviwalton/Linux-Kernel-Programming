#!/bin/bash

sudo dnf -y update

# Set the hostname, enable ssh and restart avahi servers so we can ssh via hostname.local
sudo hostname kernel-dev.local
sudo dnf -y install openssh-server nss-mdns avahi avahi-tools
sudo systemctl enable --now avahi-daemon.service
sudo systemctl enable --now sshd
sudo systemctl restart avahi-daemon.service
