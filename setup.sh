#!/bin/bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `setup.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

command_exists() {
  command -v "$@" >/dev/null 2>&1
}

install_mac() {
  echo "Instaling Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo "Installing Git..."
  brew install git

  if ! command_exists zsh; then
    echo "Installing zsh..."
    brew install zsh
  fi

  echo "Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sed '/exec zsh -l/d')"

  echo "Installing oh-my-zsh plugins..."
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

  echo "Installing Meslo Nerd fonts..."
  if [[ ! -d "$HOME/Library/Fonts" ]]; then
    mkdir $HOME/Library/Fonts
  fi
  cd $HOME/Library/Fonts 
  curl -fsSL -O https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Meslo.zip && \\
  unzip Meslo.zip && \\
  rm Meslo.zip
  cd -

  echo "Installing ruby and colorls..."
  brew install ruby
  sudo gem install colorls

  echo "Installing neovim..."
  brew install neovim

  echo "Installing ripgrep and fd..."
  brew install ripgrep
  brew install fd
}

OS=$(uname -s)
if [ "$OS" = Darwin ]; then
    echo "Setup dev enviroment for MAC"
    install_mac
  else
    echo "Do not support for $OS"
    exit 1
fi

echo "Install dependencies successfully"

DES=$HOME/dev/public-dotfiles

echo "Cloning dotfile repository..."
git clone https://github.com/minhduc-1999/public-dotfiles.git $DES

configFileOrFolder=(".tmux.conf" ".zshrc" ".config/nvim")

for config in ${configFileOrFolder[*]}; do
  if [ -e $config ]; then
    echo "Removing existing config of $config..."
    rm -rf $HOME/$config
  fi
  echo "Creating symlink for $config..."
  ln -s "$DES/$config" $HOME/$config
done
echo "Done."
