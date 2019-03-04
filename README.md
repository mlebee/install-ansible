# Install Ansible

This script is meant for quick & easy setup Ansible and its requirements below:
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
  docker-py
  pyvmomi
  redis
```


### HowTo

Run these commands to install latest release:
```
curl -fsSL https://raw.githubusercontent.com/mlebee/install-ansible/master/install.sh -o get-ansible.sh
sudo bash get-ansible.sh
```

Also, you can specify the desired release. Downgrading is supported.
```
sudo ANSIBLE_VERSION=2.5 bash get-ansible.sh
```
