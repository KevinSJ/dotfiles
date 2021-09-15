call plug#begin('~/.vim/plugged')
" Added 15/03/2021
Plug 'jlanzarotta/bufexplorer'
Plug 'roman/golden-ratio'
" Added 2021年04月01日
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'tpope/vim-eunuch'
"Plug 'ervandew/supertab'
Plug 'blarghmatey/split-expander'
Plug 'farmergreg/vim-lastplace'
Plug '907th/vim-auto-save'
" Added 2021年04月15日
Plug 'ryanoasis/vim-devicons'
" Added 2021年07月26日
"Plug 'sheerun/vim-polyglot'
"let g:deoplete#enable_at_startup = 1
Plug 'godlygeek/tabular'

" Added 2021年08月26日
Plug 'eliba2/vim-node-inspect'

" Plugs to install
" General

Plug 'iCyMind/NeoSolarized'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/echodoc.vim'
"Plug 'Lokaltog/vim-easymotion'
Plug 'sjl/gundo.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'kana/vim-textobj-user'
Plug 'tpope/vim-surround'
Plug 'qpkorr/vim-bufkill'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'rking/ag.vim'
Plug 'junegunn/vim-easy-align'
Plug 'cohama/lexima.vim'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'tpope/vim-rhubarb'
Plug 'terryma/vim-multiple-cursors'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'joshdick/onedark.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'

" Other
Plug 'hashivim/vim-terraform', {'for': 'terraform'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown' }
"Plug 'jparise/vim-graphql', {'for': ['graphql', 'javascript', 'typescript']}
"Plug 'jxnblk/vim-mdx-js', {'for': ['markdown', 'markdown.mdx']}
call plug#end()
