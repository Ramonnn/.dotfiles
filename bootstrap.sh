#!/bin/bash

# Installs ansible
sudo apt-get update && sudo apt-get install -y ansible

# Runs the first Ansible playbook using our user.
ansible-playbook -vvv ~/.dotfiles/main.yml --ask-become-pass

if [ -f ~/.ssh/github_ssh ]; then 
  echo "File exists!"
else
  ssh-keygen -t ed25519 -C "29675067+Ramonnn@users.noreply.github.com" -f ~/.ssh/github_ssh -q -N ""
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/github_ssh
  ssh-keyscan -t ed25519 github.com >> ~/.ssh/known_hosts

  # Prompt the public ssh key
  cat ~/.ssh/github_ssh.pub
  echo "Add the public key to your GitHub account. Press Enter to continue..."
  read -r
fi

