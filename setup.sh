set -e
# install-ansible/setup.sh
# This script is meant for quick & easy install Ansible:
# 'curl -sSL https://raw.githubusercontent.com/mlebee/install-ansible/master/setup.sh | sudo bash'

# check if user is ROOT
[ "$USER" = "root" ] || { echo "You must be ROOT!"; exit 1; }

# vars
ANSIBLE_VERSION="2.4"

# main
install_ansible() {
  apt-get install -q -y software-properties-common
  apt-add-repository ppa:ansible/ansible-${ANSIBLE_VERSION}
  apt-get update -qq
  apt-get install -q -y -o "Dpkg::Options::=--force-confdef" -o "Dpkg::Options::=--force-confold" ansible redis-server python-mysqldb python-apt python-netaddr
  pip install dnspython docker-py pyvmomi redis
}

# wrapped up in a function so that we have some protection against only getting
# half the file during "curl | sh"
install_ansible
