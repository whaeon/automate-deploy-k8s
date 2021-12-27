# k8s-ansible

## Precondition
 1. you need to connect remote host without password by ssh which host you used.
 2. modify host ip address, user, and password in host.yaml file.

## Quick start
before you start with the below command,you need to install the software `sshpass` first.
```bash
ansible-playbook k8s-install.yaml -i host.yaml
```
