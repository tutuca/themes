set nocompatible
syntax on

"set et
set ruler
set expandtab
set ts=4
set sw=4
set shiftwidth=4
set softtabstop=4
set smartindent
set hidden
set columns=79

set hlsearch
set incsearch
set ignorecase
set smartcase

set guioptions-=T
set guioptions-=m

call pathogen#infect()
call pathogen#runtime_append_all_bundles()

filetype on
filetype plugin on

nmap <S-Tab> <<
imap <S-Tab> <Esc><<i

set wildchar=<Tab> wildmenu wildmode=full

set laststatus=2
set statusline=%t\ %=%y\ [%c,%l]
