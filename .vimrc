set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'spolu/dwm.vim'
Plug 'w0ng/vim-hybrid'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'editorconfig/editorconfig-vim'
Plug 'szw/vim-maximizer'
Plug 'myusuf3/numbers.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim'
Plug 'rstacruz/vim-fastunite'
Plug 'joukevandermaas/vim-ember-hbs'

call plug#end()

filetype plugin indent on

set modelines=0 " don't use modelines
set nocompatible
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set hidden
set autoindent
set number
set copyindent
set shiftround
set ttyfast
set scrolloff=3
set cursorline
set ruler
set backspace=indent,eol,start
set undofile " unlimited undos with .un~ files
set visualbell "don't beep
set noerrorbells
set title
set ignorecase
set smartcase
set wildmenu
set gdefault " substitutions are made globally
" handle search highlight and clear
nnoremap <leader><space> :noh<cr>
" use tab to navigate match bracket pairs
set showcmd
set autoindent
set mouse=a
set nohidden
set noerrorbells
set visualbell
" handle long lines correctly
set wrap
set textwidth=79
set formatoptions=qrn1
" show invisibile characters -> getting used to
set list
set listchars=tab:▸\ ,eol:¬
set clipboard=unnamed

syntax on

" navigate by screen line
nnoremap j gj
nnoremap k gk

" autosave on lost focus
au FocusLost * :wa

"for Zend phtml files
"autocmd BufEnter *.phtml set syn=php

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

map <C-p> [unite]p
nnoremap <space>/ :Unite grep:.<cr>
nnoremap <space>e :Unite -no-split -buffer-name=buffer -quick-match buffer<cr>
let g:unite_enable_split_vertically = 0
let g:unite_winheight = 30
let g:unite_data_directory = '~/.vim/tmp/unite/'
let g:unite_source_grep_default_opts = '--column --no-color --nogroup --with-filename'

"let mapleader = "," " used for ack
"nnoremap <leader>a :Ack
"replaced with Unite at least for the moment

if !exists("autocmd_colorscheme_loaded")
    let autocmd_colorscheme_loaded = 1
    autocmd ColorScheme * highlight todo      ctermbg=red guibg=#002b37 ctermfg=LightRed     guifg=#E01B1B
    autocmd ColorScheme * highlight note   ctermbg=LightYellow guibg=#002b37 ctermfg=DarkRed guifg=#E0841B
    autocmd ColorScheme * highlight followup   ctermbg=green guibg=#002b37 ctermfg=White guifg=#ffffff
    autocmd ColorScheme * highlight reminder   ctermbg=blue guibg=#002b37 ctermfg=LightYellow  guifg=#E0D91B
endif
if has("autocmd")
    if v:version > 701
        autocmd Syntax * call matchadd('todo',  '\W\zs\(@todo\)')
        autocmd Syntax * call matchadd('note', '\W\zs\(@note\)')
        autocmd Syntax * call matchadd('followup', '\W\zs\(@followup\)')
        autocmd Syntax * call matchadd('reminder', '\W\zs\(@rem\)')
    endif
endif
nnoremap <tab> %
vnoremap <tab> %

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

set pastetoggle=<F2>

:set cpoptions+=$

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" recognize typescript files
autocmd BufRead,BufNewFile *.ts set filetype=typescript

" 72 columns to commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

set t_Co=256
set background=dark
colorscheme hybrid
