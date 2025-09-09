#!/bin/sh
nvim_config_file=~/.config/nvim
DOTFILES_ROOT=$(pwd -P)

mkdir -p ~/.config/

if [ ! -L "$nvim_config_file" ]; then
  ln -s $DOTFILES_ROOT/nvim.symlink "$nvim_config_file"
fi
