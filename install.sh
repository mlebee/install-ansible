#!/bin/bash
set -e

# install-ansible/setup.sh
# This script is meant for quick & easy install Ansible:
#   $ curl -fsSL https://raw.githubusercontent.com/mlebee/install-ansible/master/install.sh -o get-ansible.sh
#   $ bash get-ansible.sh
#
# NOTE: Make sure to verify the contents of the script
#       you downloaded matches the contents of install.sh
#       located at https://github.com/mlebee/install-ansible
#       before executing.


# check if user is ROOT
[ "$USER" = "root" ] || { echo "You must be ROOT!"; exit 1; }

# Ensure os is ubuntu xenial or later
source /etc/os-release || { echo "OS cannot be determined!"; exit 1; }
if [[ "${ID}" != "ubuntu" ]]
  then
    echo "Only Ubuntu is supported!"
    exit 1
fi
if [[ ${VERSION_ID%.*} -lt 16 ]]
  then
    echo "Ubuntu prior to xenial is not supported!"
    exit 1
fi

# main
install_ansible() {
  apt install -q -y software-properties-common
  rm -vrf /etc/apt/sources.list.d/ansible-*
  if [[ -z ${ANSIBLE_VERSION} ]]
    then
      # install latest release
      apt-add-repository -y --update ppa:ansible/ansible
      apt install -qq -y -o "Dpkg::Options::=--force-confdef" -o "Dpkg::Options::=--force-confold" ansible
    else
      #install specific  release
      apt-add-repository -y --update ppa:ansible/ansible-${ANSIBLE_VERSION}
      PKG_VERSION=$(apt-cache madison ansible | grep "${ANSIBLE_VERSION}" | head -1 | cut -d" " -f 6)
      apt install -qq -y -o "Dpkg::Options::=--force-confdef" -o "Dpkg::Options::=--force-confold" --allow-downgrades ansible=${PKG_VERSION}
  fi
  apt install -qq -y -o "Dpkg::Options::=--force-confdef" -o "Dpkg::Options::=--force-confold" redis-server python-mysqldb python-apt python-netaddr
  pip install -q dnspython docker-py pyvmomi redis
  ansible --version
}

# wrapped up in a function so that we have some protection against only getting
# half the file during "curl | bash"
install_ansible
