# Install Ansible

This script is meant for quick & easy setup Ansible and its requirements below on **Ubuntu Xenial** (or later):
- apt packages:
```
  redis-server
  python-mysqldb
  python-apt
  python-netaddr
```

- pip packages:
```
  dnspython
  docker
  pyvmomi
  redis
```


### HowTo

Run these commands to install latest release:
```
curl -fsSL https://raw.githubusercontent.com/mlebee/install-ansible/master/install.sh -o get-ansible.sh
sudo -H bash get-ansible.sh
```

Also, you can specify the desired release. Downgrading is supported.
```
sudo -H ANSIBLE_VERSION=2.5 bash get-ansible.sh
```
