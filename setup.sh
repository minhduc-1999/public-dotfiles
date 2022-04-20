#!/bin/bash

configFileOrFolder=(".tmux.conf" ".zshrc" "config/nvim")

for config in ${configFileOrFolder[*]}
do
  if [ -e $config ]
  then
    echo "Removing existing config of $config..."
    rm -rf $HOME/$config
  fi
  echo "Creating symlink for $config..."
  ln -s "$(pwd)/$config" $HOME/$config
done
echo "Done."
