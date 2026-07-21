#!/bin/bash
set -euo pipefail

apt update
apt install -y git ansible

mkdir -p /home/andybob/.ssh
chmod 700 /home/andybob/.ssh

if [ ! -f /root/.ssh/id_ansible_pull ]; then
    ssh-keygen -t ed25519 -f /home/andybob/.ssh/id_ansible_pull -C "ansible-pull" -N ""
fi

echo "==== PUBLIC KEY FOR GITHUB DEPLOY KEY ===="
cat /home/andybob/.ssh/id_ansible_pull.pub
echo "=========================================="
echo "Add this key as a READ-ONLY Deploy Key in your GitHub repo."
echo "Press enter when ready."
read

ANSIBLE_SSH_ARGS="-i /root/.ssh/id_ansible_pull" \
ansible-pull \
  -U https://github.com/AndyBarkley/bootstrap-mimimal.git \
  -d /home/andybob/.ansible/pull/bootstrap-minimal  \
  site.yml
