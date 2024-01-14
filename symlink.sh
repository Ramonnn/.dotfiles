sudo apt update && sudo apt upgrade 

REQUIRED_PKG="git"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  sudo apt install $REQUIRED_PKG
fi

ln -sv "~/.dotfiles/.gitconfig ~/.gitconfig"

REQUIRED_PKG="zsh"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  sudo apt install $REQUIRED_PKG
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ln -sv "~/.dotfiles/.zshrc ~/.zshrc"
ln -sv "~/.dotfiles/.p10k.zsh ~/.p10k.zsh"

REQUIRED_PKG="tmux"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  sudo apt install $REQUIRED_PKG
fi

ln -sv "~/.dotfiles/.tmux.conf ~/.tmux.conf"

sudo apt autoremove && sudo apt clean

