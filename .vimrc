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
set number
set background=dark
set hlsearch
set incsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set guioptions-=T
set wildchar=<Tab> wildmenu wildmode=full
set paste
set laststatus=2
set statusline=%t\ %=%y\ [%c,%l]

autocmd FileType python set ft=python.django " For SnipMate
autocmd FileType html set ft=htmldjango.html " For SnipMate


call pathogen#infect()
call pathogen#runtime_append_all_bundles()

filetype on
filetype plugin on

nmap <S-Tab> <<
imap <S-Tab> <Esc><<i

imap jj <Esc>
imap kk <Esc>

colorscheme solarized
