-- TO BE MIGRATED TO SEPARATE FILE
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true,              -- false will disable the whole extension
        disable = { "c", "rust", "c_sharp" },  -- list of language that will be disabled
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}

vim.cmd('colorscheme onedark')
vim.cmd('syntax off')

vim.g.loaded_gzip              = 1
vim.g.loaded_tar               = 1
vim.g.loaded_tarPlugin         = 1
vim.g.loaded_zip               = 1
vim.g.loaded_zipPlugin         = 1
vim.g.loaded_getscript         = 1
vim.g.loaded_getscriptPlugin   = 1
vim.g.loaded_vimball           = 1
vim.g.loaded_vimballPlugin     = 1
vim.g.loaded_matchit           = 1
vim.g.loaded_matchparen        = 1
vim.g.loaded_2html_plugin      = 1
vim.g.loaded_logiPat           = 1
vim.g.loaded_rrhelper          = 1
vim.g.loaded_netrw             = 1
vim.g.loaded_netrwPlugin       = 1
vim.g.loaded_netrwSettings     = 1
vim.g.loaded_netrwFileHandlers = 1
-- BEGIN custom config
--vim.g.jsx_ext_required          =  0
--vim.g.airline_powerline_fonts   =  1
--vim.g.go_highlight_extra_types  =  1
--vim.g.go_highlight_fields       =  1
--vim.g.go_highlight_functions    =  1
--vim.g.go_highlight_methods      =  1
--vim.g.go_highlight_operators    =  1
--vim.g.go_highlight_structs      =  1
--vim.g.go_highlight_types        =  1
--vim.g.go_auto_type_info         =  1
--vim.g.ackprg                    =  'ag --nogroup  --nocolor  --column'
--vim.g.go_fmt_command            =  "goimports"

-- TO BE MIGRATED TO go_highlight_build_constraints = 1SEPARATE FILE
