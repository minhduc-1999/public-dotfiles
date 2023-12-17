#!/bin/bash

install_mac() {
  echo "Installing for MacOS..."

  echo "Instaling Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo "Installing Git..."
  brew install git

  echo "Installing iTerm2..."
  brew install zsh

  echo "Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  echo "Installing oh-my-zsh plugins..."
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

  echo "Installing Meslo Nerd font..."
  if [[ -d "$HOME/Library/Fonts" ]]; then
    mkdir $HOME/Library/Fonts
    cd $HOME/Library/Fonts 
    curl -fsSL -O https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
    curl -fsSL -O https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
    curl -fsSL -O https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
    curl -fsSL -O https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
    cd -
  fi

  echo "Installing ruby and colorls..."
  brew install ruby
  echo 'export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.1.0/bin:$PATH"' >> ~/.zshrc
  gem install colorls
  source ./zshrc

  echo "Installing neovim..."
  brew install neovim

  echo "Installing ripgrep for telescope file grep..."
  brew install ripgrep
}

echo "OS Detecting..."
OS=$(uname -s)
if [ "$OS" = Darwin ]; then
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
