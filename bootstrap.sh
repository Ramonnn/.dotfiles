set -e

# Dotfiles' project root directory
ROOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Host file location
HOSTS="$ROOTDIR/hosts"
# Playbook 1
PLAYBOOK_1="$ROOTDIR/dotfiles.yml"
# Playbook 2
PLAYBOOK_2="$ROOTDIR/dotfiles.yml"

# Installs ansible
sudo apt-get update && sudo apt-get install -y ansible

if [ -e "~/.ssh/github_ssh" ]; then 
  echo "ssh file already exists."  
else
  ssh-keygen -t ed25519 -C "git@github.com:Ramonnn/lazy-nvim-setup.git" -f ~/.ssh/github_ssh -q -N ""
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/github_ssh
fi

# Runs the first Ansible playbook using our user.
ansible-playbook -vvv -i "$HOSTS" "$PLAYBOOK_1" --ask-become-pass

# Prompt the public ssh key
cat ~/.ssh/github_ssh.pub
echo "Add the public key to your GitHub account. Press Enter to continue..."
read -r

# Runs the second Ansible playbook using our user.
ansible-playbook -vvv -i "$HOSTS" "$PLAYBOOK_2" --ask-become-pass
exit 0
