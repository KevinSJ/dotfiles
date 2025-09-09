-----------------------------------------------------------
-- Treesitter configuration file
----------------------------------------------------------

-- Plugin: nvim-treesitter
-- URL: https://github.com/nvim-treesitter/nvim-treesitter

local status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

-- See: https://github.com/nvim-treesitter/nvim-treesitter#quickstart
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  --ensure_installed = "all",
  ensure_installed = {
    'angular', 'awk', 'bash', 'c', 'c_sharp', 'cmake', 'cpp', 'css', 'csv',
    'dart', 'diff', 'dockerfile', 'dot', 'elixir', 'elm', 'erlang', 'fish',
    'git_config', 'git_rebase', 'gitattributes', 'gitcommit',
    'gitignore', 'go', 'haskell', 'html', 'http', 'java', 'javascript', 'json', 'lua',
    'luadoc', 'make', 'markdown', 'markdown_inline', 'nix', 'perl', 'python',
    'query', 'regex','rust', 'sql', 'toml', 'typescript', 'vim', 'yaml',
    'hurl', 'jsonc', 'terraform', 'vue', 'ruby','rust', 'sql', 'toml', 'typescript', 'vim', 'yaml'
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

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      scope_incremental = "<CR>",
      node_incremental = "<TAB>",
      node_decremental = "<S-TAB>",
    },
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

require'treesitter-context'.setup{
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
