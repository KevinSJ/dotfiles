--[[

Neovim init file
Maintainer: brainf+ck
Website: https://github.com/brainfucksec/neovim-lua

--]]

-- Change leader to space
vim.g.mapleader = ' '
--vim.lsp.set_log_level("debug")

-- Import Lua modules
require('core/lazy')
require('core/autocmds')
require('core/colors')
require('core/statusline')
require('core/functions')
require('core/options')
require('lsp/lspconfig')
require('plugins/init')
require('core/keymaps')
