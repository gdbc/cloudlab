#!/bin/bash
USERNAME=$1
sudo yum install docker -y
sudo systemctl enable docker
sudo systemctl start docker
sudo groupadd docker
sudo chown root.docker /var/run/docker.sock
sudo usermod -G docker $USERNAME
sudo firewall-cmd --zone=public --add-port=6443/tcp --permanent
sudo firewall-cmd --zone=public --add-port=8472/udp --permanent
sudo firewall-cmd --zone=public --add-port=9099/tcp --permanent
sudo firewall-cmd --zone=public --add-port=2376/tcp --permanent
sudo firewall-cmd --zone=public --add-port=2379/tcp --permanent
sudo firewall-cmd --zone=public --add-port=2380/tcp --permanent
sudo firewall-cmd --zone=public --add-port=443/tcp --permanent
sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
sudo firewall-cmd --zone=public --add-port=10250/tcp --permanent
sudo firewall-cmd --zone=public --add-port=10254/tcp --permanent
sudo firewall-cmd --reload
