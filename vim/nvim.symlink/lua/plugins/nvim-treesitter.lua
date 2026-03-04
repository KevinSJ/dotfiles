-----------------------------------------------------------
-- Treesitter configuration file
----------------------------------------------------------

-- Plugin: nvim-treesitter
-- URL: https://github.com/nvim-treesitter/nvim-treesitter

local status_ok, _ = pcall(require, 'nvim-treesitter')
if not status_ok then
  return
end

vim.keymap.set({ "n" }, "<cr>", function()
  local node = vim.treesitter.get_node()
  if not node then return end

  local start_row, start_col, end_row, end_col = node:range()
  vim.fn.setpos("'<", { 0, start_row + 1, start_col + 1, 0 })
  vim.fn.setpos("'>", { 0, end_row + 1, end_col, 0 })
  vim.cmd('normal! gv')
end, { desc = "Select treesitter node" })

vim.api.nvim_create_autocmd({ 'Filetype' }, {
  callback = function(event)
    local ignored_fts = {
      'snacks_dashboard',
      'snacks_notif',
      'snacks_input',
      'prompt', -- bt: snacks_picker_input
    }

    if vim.tbl_contains(ignored_fts, event.match) then return end

    -- make sure nvim-treesitter is loaded
    local ok, nvim_treesitter = pcall(require, 'nvim-treesitter')

    -- no nvim-treesitter, maybe fresh install
    if not ok then return end

    local ft = vim.bo[event.buf].ft
    local lang = vim.treesitter.language.get_lang(ft)
    nvim_treesitter.install({ lang }):await(function(err)
      if err then
        vim.notify('Treesitter install error for ft: ' .. ft .. ' err: ' .. err)
        return
      end

      pcall(vim.treesitter.start, event.buf)
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    end)
  end,
})

-- See: https://github.com/nvim-treesitter/nvim-treesitter#quickstart
require 'nvim-treesitter'.setup {
  -- A list of parser names, or "all"
  --ensure_installed = "all",
  ensure_installed = {
    'angular', 'awk', 'bash', 'c', 'c_sharp', 'cmake', 'cpp', 'css', 'csv', 'cython',
    'dart', 'diff', 'dockerfile', 'dot', 'elixir', 'elm', 'erlang', 'fish',
    'git_config', 'git_rebase', 'gitattributes', 'gitcommit', 'kotlin',
    'gitignore', 'go', 'haskell', 'html', 'http', 'java', 'javascript', 'json', 'lua',
    'luadoc', 'make', 'markdown', 'markdown_inline', 'nix', 'perl', 'python',
    'query', 'regex', 'rust', 'sql', 'toml', 'typescript', 'vim', 'yaml', 'latex',
    'hurl', 'jsonc', 'terraform', 'vue', 'ruby', 'rust', 'sql', 'toml', 'typescript', 'vim', 'yaml'
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "phpdoc", "tree-sitter-phpdoc" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "phpdoc", "tree-sitter-phpdoc" }, -- list of language that will be disabled

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  context_commentstring = {
    enable = true,
  },

  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
      }
    },
  },
}

require 'treesitter-context'.setup {
  enable = true,
  patterns = {
    default = {
      'class',
      'function',
      'method',
      'for',
      'while',
      'if',
      'switch',
      'case',
    },
    json = {
      'pair',
    },
    terraform = {
      'block',
    }
  },
  mode = 'topline',
}
