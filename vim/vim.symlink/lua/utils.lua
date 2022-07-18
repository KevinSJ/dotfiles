-- Shamelessly copied from https://github.com/ahmedelgabri/dotfiles/blob/main/config/nvim/lua/_/utils/map.lua

local M = {}
local api = vim.api

function M.map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.mapBuf(buf, mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  api.nvim_buf_set_keymap(buf, mode, lhs, rhs, options)
end

function M.autocmd(event, command, pattern)
    pattern = pattern or "*"
    opts = { command = command, pattern = pattern}

    api.nvim_create_autocmd(event, opts)
end

--[[
   [function M.map(event, command, augroup, pattern)
   [    api.nvim_create_autocmd(event, {
   [        command = command,
   [        pattern = pattern,
   [        group = augroup,
   [    })
   [end
   ]]

return M
