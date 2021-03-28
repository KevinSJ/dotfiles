#!/bin/sh
nvim_config_file=~/.config/nvim
DOTFILES_ROOT=$(pwd -P)

mkdir -p ~/.config/

if [ ! -L "$nvim_config_file" ]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  ln -s $DOTFILES_ROOT/vim/vim.symlink "$nvim_config_file"
fi
