#!/bin/bash

DEBIAN_FRONTEND=noninteractive sudo apt-get -qqy update
DEBIAN_FRONTEND=noninteractive sudo apt-get dist-upgrade -y
DEBIAN_FRONTEND=noninteractive sudo apt-get install htop snapd figlet -y
grep -qxF 'figlet FCC Course' /home/vagrant/.bashrc || echo 'figlet FCC Course' >> /home/vagrant/.bashrc
sudo snap install yq