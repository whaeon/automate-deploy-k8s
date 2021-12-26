#!/bin/bash

# config not root user use kubectl
mkdir -p /home/$1/.kube
rm -rf /home/$1/.kube/config
cp /etc/kubernetes/admin.conf /home/$1/.kube/config
chown -R $1:$1 /home/$1/.kube/

# wget -P /tmp https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

# kubectl apply -f /tmp/kube-flannel.yml