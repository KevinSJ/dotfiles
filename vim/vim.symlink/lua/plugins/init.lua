--https://github.com/NvChad/NvChad/blob/main/lua/plugins/init.lua
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
   -- this is arranged on the basis of when a plugin starts

   use "nvim-lua/plenary.nvim"

   use {
      "wbthomason/packer.nvim",
      event = "VimEnter",
   }

   use {
      "kyazdani42/nvim-web-devicons",
   }

   use {
      "nvim-treesitter/nvim-treesitter",
      event = "BufRead",
      config = function()
          require('pluginconfig.nvim-treesitter')
      end
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
