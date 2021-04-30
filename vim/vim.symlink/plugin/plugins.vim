call plug#begin('~/.vim/plugged')
" Added 15/03/2021
Plug 'jlanzarotta/bufexplorer'
Plug 'roman/golden-ratio'
" Added 2021年04月01日
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'tpope/vim-eunuch'
Plug 'ervandew/supertab'
Plug 'blarghmatey/split-expander'
Plug 'farmergreg/vim-lastplace'
Plug '907th/vim-auto-save'
" Added 2021年04月15日
"Plug 'sheerun/vim-polyglot'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
"let g:deoplete#enable_at_startup = 1

" Plugs to install
" General
Plug 'iCyMind/NeoSolarized'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/echodoc.vim'
Plug 'janko-m/vim-test'
"Plug 'Lokaltog/vim-easymotion'
Plug 'bkad/CamelCaseMotion'
Plug 'sickill/vim-pasta'
Plug 'sjl/gundo.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'kana/vim-textobj-user'
Plug 'ntpeters/vim-better-whitespace'
"Plug 'tpope/vim-surround'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'qpkorr/vim-bufkill'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'rking/ag.vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'cohama/lexima.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'danro/rename.vim'
Plug 'tpope/vim-rhubarb'
Plug 'terryma/vim-multiple-cursors'
Plug 'metakirby5/codi.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }
Plug 'voldikss/vim-floaterm'
Plug 'joshdick/onedark.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'
" Ruby
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'tpope/vim-endwise', {'for': 'ruby'}
Plug 'nelstrom/vim-textobj-rubyblock', {'for': 'ruby'}

" Javascript
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
" Disabled for now due to buggy typescript integration
"Plug 'styled-components/vim-styled-components', {'for': ['javascript', 'typescript', 'typescript.tsx'], 'branch': 'main'}

Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }
Plug 'chemzqm/vim-jsx-improve'
Plug 'MaxMEllon/vim-jsx-pretty'

" Golang
Plug 'fatih/vim-go', {'for': 'go'}

" CSS
Plug 'JulesWang/css.vim', {'for': 'css'}
Plug 'othree/csscomplete.vim', {'for': 'css'}
Plug 'ap/vim-css-color', {'for': 'css'}

" Python
Plug 'psf/black', {'for': 'python'}

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'mattn/webapi-vim'

" Other
Plug 'tomlion/vim-solidity', {'for': 'solidity'}
Plug 'hashivim/vim-terraform', {'for': 'terraform'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown' }
Plug 'jparise/vim-graphql', {'for': ['graphql', 'javascript', 'typescript']}
Plug 'jxnblk/vim-mdx-js', {'for': ['markdown', 'markdown.mdx']}
Plug 'vim-syntastic/syntastic'
call plug#end()
