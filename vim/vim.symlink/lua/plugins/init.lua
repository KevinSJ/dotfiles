--https://github.com/NvChad/NvChad/blob/main/lua/plugins/init.lua
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  --vim.api.nvim_command('packadd packer.nvim')
end

return require('packer').startup(function(use)
   -- this is arranged on the basis of when a plugin starts
   use {
      "wbthomason/packer.nvim",
      event = "VimEnter",
   }

   use "nvim-lua/plenary.nvim"


   use {
      "kyazdani42/nvim-web-devicons",
   }

   --[[
      [use {
      [    "fatih/vim-go",
      [}
      ]]

   use {
      "nvim-treesitter/nvim-treesitter",
      event = "VimEnter",
      run = ":TSUpdate",
      config = function()
          require('pluginconfig.nvim-treesitter')
      end
   }

   use{
       "nvim-treesitter/nvim-treesitter-refactor",
       requires = {
           { "nvim-treesitter/nvim-treesitter" },
       },
       config = function()
           require('pluginconfig.nvim-treesitter')
       end,
       after= "nvim-treesitter/nvim-treesitter",
   }

   use{
       "nvim-treesitter/nvim-treesitter-textobjects",
       requires = {
           { "nvim-treesitter/nvim-treesitter" },
       },
       config = function()
           require('pluginconfig.nvim-treesitter')
       end,
       after= "nvim-treesitter/nvim-treesitter",
   }

   use{
       "nvim-treesitter/nvim-treesitter-context",
       requires = {
           { "nvim-treesitter/nvim-treesitter" },
       },
       config = function()
           require('pluginconfig.nvim-treesitter-context')
       end,
       after= "nvim-treesitter/nvim-treesitter",
   }
   -- file managing , picker etc
   use {
      "kyazdani42/nvim-tree.lua",
      -- only set "after" if lazy load is disabled and vice versa for "cmd"
      after = "nvim-web-devicons",
   }

   use {
        "nvim-telescope/telescope-file-browser.nvim"
   }
   use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
   use {
      "nvim-telescope/telescope.nvim",
      requires = {
        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      },
      config = function()
          require('pluginconfig.telescope-config')
      end
   }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
