-----------------------------------------------------------
-- Neovim LSP configuration file
-----------------------------------------------------------

-- Plugin: nvim-lspconfig
-- url: https://github.com/neovim/nvim-lspconfig

-- For configuration see the Wiki: https://github.com/neovim/nvim-lspconfig/wiki
-- Autocompletion settings of "nvim-cmp" are defined in plugins/nvim-cmp.lua
local home = os.getenv "HOME"

lspconfig = vim.lsp.config
enable = vim.lsp.enable

local cmp_status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_status_ok then
  return
end

-- Add additional capabilities supported by nvim-cmp
-- See: https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  --vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true)
  end

  -- Highlighting references.
  -- See: https://sbulav.github.io/til/til-neovim-highlight-references/
  -- for the highlight trigger time see: `vim.opt.updatetime`
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
    vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
    vim.api.nvim_create_autocmd('LspNotify', {
      callback = function(args)
        if args.data.method == 'textDocument/didOpen' then
          vim.lsp.foldclose('imports', vim.fn.bufwinid(args.buf))
        end
      end,
      desc = "Auto fold all imports"
    })
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = vim.lsp.buf.document_highlight,
      buffer = bufnr,
      group = "lsp_document_highlight",
      desc = "Document Highlight",
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      callback = vim.lsp.buf.clear_references,
      buffer = bufnr,
      group = "lsp_document_highlight",
      desc = "Clear All the References",
    })
  end

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  -- DISABLED BEACAUSE IT CONFLICTS WITH TMUX NAVIGATION
  --vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- Diagnostic settings:
-- see: `:help vim.diagnostic.config`
-- Customizing how diagnostics are displayed
vim.diagnostic.config({
  update_in_insert = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

-- Show line diagnostics automatically in hover window
vim.cmd([[
  autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false })
]])

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
--vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

--[[
Language servers setup:

For language servers list see:
https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

Language server installed:

Bash          -> bashls
Python        -> pyright
C-C++         -> clangd
HTML/CSS/JSON -> vscode-html-languageserver
JavaScript/TypeScript -> ts_ls
Java/Kotlin          -> jdtls
--]]

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches.
-- Add your language server below:
local servers = { 'bashls', 'lua_ls', 'jdtls', 'ts_ls', 'eslint', 'pyright', 'clangd', 'html',
  'cssls' }

local jar_dir = home .. "/jars/lombok.jar"

require('spring_boot').init_lsp_commands()

vim.lsp.config['jdtls'] = {
  cmd = {
    "jdtls",
    "--no-validate-java-version",
  },
  flags = {
    allow_incremental_sync = true,
  },
  handlers = {
    ["language/status"] = function() end,
  },
  --[[
     [cmd = {
     [  'jdtls',
     [  '--java-executable',
     [  '/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home/bin/java',
     [  '--jvm-arg=-javaagent:' .. jar_dir,
     [},
     ]]
  detached = true,

  -- `root_dir` must point to the root of your project.
  -- See `:help vim.fs.root`
  --root_markers = vim.fs.root(0, { 'gradlew', '.git', 'mvnw' }),
  root_markers = { { "mvnw", "gradlew", "settings.gradle", "settings.gradle.kts", ".git" }, { "build.xml", "pom.xml", "build.gradle", "build.gradle.kts" } },
  filetypes = { 'java', 'kotlin' },
  --root_dir = root_dir,
  capabilities = capabilities,
  on_attach = on_attach,
  init_options = {
    bundles = require("spring_boot").java_extensions(),
  },
  settings = {
    java = {
      --home = "/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home",
      --home = "/usr/lib/jvm/default-runtime",
      home = "/usr/lib/jvm/java-21-openjdk",
      eclipse = {
        downloadSources = true,
      },
      imports = {
        gradle = {
          wrapper = {
            checksums = { 'f86344275d1b194688dd330abf9f6f2344cd02872ffee035f2d1ea2fd60cf7f3' }
          }
        }
      },
      import = {
        gradle = {
          enabled = false,
          wrapper = {
            enabled = true
          },
          offline = {
            enabled = true
          },
          annotationProcessing = {
            enabled = true
          }
        },
        maven = {
          enabled = true
        }
      },
      gradle = {
        enabled = true,
        wrapper = {
          enabled = true
        },
        offline = {
          enabled = true
        }
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      inlayHints = {
        parameterNames = {
          enabled = "all", -- literals, all, none
        },
      },
      configuration = {
        updateBuildConfiguration = "interactive",
        runtimes = {
          {
            name = "JavaSE-21",
            path = "/usr/lib/jvm/java-21-openjdk",
            default = true
          },
          {
            name = "JavaSE-17",
            path = "/usr/lib/jvm/java-17-openjdk",
          },
        },
      },
    },
  },
}

vim.lsp.config['ts_ls'] = {
  handlers = handlers,
  on_attach = on_attach,
  root_dir = root_dir,
  cmd = { "bunx", "typescript-language-server", "--stdio" },
  capabilities = capabilities,
  single_file_support = true,
  commands = {
    TSOrganizeImports = {
      TSOrganizeImports,
      description = "Organize Imports",
    },
    TSRemoveUnused = {
      TSRemoveUnused,
      description = "Remove unused",
    },
  },
  completions = {
    completeFunctionCalls = true,
  },
  settings = {
    javascript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = false,
      },
    },

    typescript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = false,
      },
    },
  },
}



vim.lsp.config['eslint'] = {
  on_attach = function(client, bufnr)
    -- you can add other stuff here e.g. keymaps
    on_attach(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
  root_dir = root_dir,
  capabilities = capabilities,
}


-- Call setup
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = on_attach,
    --root_dir = root_dir,
    capabilities = capabilities,
  })
end

vim.lsp.enable(servers)
