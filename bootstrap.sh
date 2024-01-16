set -e

# Dotfiles' project root directory
ROOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Host file location
HOSTS="$ROOTDIR/hosts"
# Playbook 1
PLAYBOOK_1="$ROOTDIR/dotfiles_1.yml"
# Playbook 2
PLAYBOOK_2="$ROOTDIR/dotfiles_2.yml"

# Installs ansible
sudo apt-get update && sudo apt-get install -y ansible

ssh-keygen -t ed25519 -C "29675067+Ramonnn@users.noreply.github.com" -f ~/.ssh/github_ssh -q -N ""
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github_ssh

# Runs the first Ansible playbook using our user.
ansible-playbook -vvv -i "$HOSTS" "$PLAYBOOK_1" --ask-become-pass

# Prompt the public ssh key
cat ~/.ssh/github_ssh.pub
echo "Add the public key to your GitHub account. Press Enter to continue..."
read -r

# Runs the second Ansible playbook using our user.
ansible-playbook -vvv -i "$HOSTS" "$PLAYBOOK_2" --ask-become-pass
exit 0
