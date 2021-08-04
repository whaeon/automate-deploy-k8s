# k8s-ansible

## Precondition
 1. you need to connect remote host without password by ssh which host you used.
 2. modify host ip address, user, and password in host.yaml file.

## Quick start
```bash
ansible-playbook k8s-install.yaml -i host.yaml
