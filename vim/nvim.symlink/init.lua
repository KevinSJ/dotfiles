--[[

Neovim init file
Maintainer: brainf+ck
Website: https://github.com/brainfucksec/neovim-lua

--]]

vim.opt.runtimepath:remove(vim.fn.expand('~/.config/nvim/'))
vim.opt.runtimepath:remove(vim.fn.expand('~/dotfiles/'))
vim.opt.runtimepath:remove(vim.fn.expand('~/.vim/'))
vim.opt.packpath:remove(vim.fn.expand('~/.local/share/nvim/site'))
-- Change leader to space
vim.g.mapleader = ' '

-- Import Lua modules
vim.api.nvim_command('let &packpath = &runtimepath')
vim.api.nvim_command('set runtimepath^=~/Private/neovim-lua/nvim/')
require('core/lazy')
vim.api.nvim_command('set runtimepath^=~/Private/neovim-lua/nvim/')
require('core/autocmds')
require('core/colors')
require('core/statusline')
require('core/options')
require('lsp/lspconfig')
require('plugins/init')
require('core/keymaps')
