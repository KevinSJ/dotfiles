#!/bin/sh

nvim_config_file=~/.config/nvim

mkdir -p ~/.config/

if [ ! -L "$nvim_config_file" ]; then
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  ln -s ~/.dotfiles/vim/vim.symlink "$nvim_config_file"
fi
