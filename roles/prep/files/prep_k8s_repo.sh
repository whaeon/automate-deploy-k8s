#!/bin/bash

# shutdown swap temperary
sudo swapoff -a

# shutdown swap permanent
sudo sed -i '#^/swap#d' /etc/fstab

mkdir ~/test
# clean repo cache
sudo rm /usr/share/keyrings/kubernetes-archive-keyring.gpg 2> /dev/null
sudo rm /etc/apt/sources.list.d/kubernetes.list 2> /dev/null

# clean old cluster cache
echo y | sudo kubeadm reset
sudo rm -rf /etc/kubernetes

# prep k8s repository
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
