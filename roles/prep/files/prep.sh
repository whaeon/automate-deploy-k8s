#!/bin/bash

# config ustc accelerate address
curl -fsSL https://raw.githubusercontent.com/EagleChen/kubernetes_init/master/kube_apt_key.gpg | apt-key add -
add-apt-repository "deb http://mirrors.ustc.edu.cn/kubernetes/apt kubernetes-xenial main"
gpg --keyserver keyserver.ubuntu.com --recv-keys B53DC80D13EDEF05
gpg --export --armor B53DC80D13EDEF05 | apt-key add -

# shutdown swap temperary
swapoff -a

# shutdown swap permanent
sed -i '/swap/d' /etc/fstab

# clean old cluster cache
echo y | kubeadm reset
rm -rf /etc/kubernetes

# extract images
cd ~/images
for i in $(ls ~/images)
do
    ctr -n k8s.io image import $i
done