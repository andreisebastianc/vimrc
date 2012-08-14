" ~/.vimrc (configuration file for vim only)
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on
call pathogen#helptags()

autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

" filetypes
filetype plugin on
filetype indent on
>>>>>>> Work_Branch

nmap <silent> <C-d> :NERDTreeToggle<CR>
imap <silent> <C-d> :NERDTreeToggle<CR>

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
"set relativenumber " show absolute line number
set undofile " unlimited undos with .un~ files
set visualbell "don't beep
set noerrorbells
set title
set ignorecase
set smartcase
let mapleader = "," " this needs some testing -> replaces \
set gdefault " substitutions are made globally
" handle search highlight and clear
"set incsearch
"set showmatch
"set hlsearch
nnoremap <leader><space> :noh<cr>
" use tab to navigate match bracket pairs
nnoremap <tab> %
vnoremap <tab> %
" set smarttab
" set undolevels=1000

let &statusline="%< %f %{fugitive#statusline()} ... (When I grow up, I'd like to be dangerous.)"
"navigation helper
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"for sudo purpose
cmap w!! w !sudo tee % >/dev/null
set pastetoggle=<F2>
:filetype plugin on
set t_Co=256

syntax enable

" color definitions
if !exists("autocmd_colorscheme_loaded")
    let autocmd_colorscheme_loaded = 1
    autocmd ColorScheme * highlight TodoDarkRed      ctermbg=darkred guibg=#002b37 ctermfg=LightRed     guifg=#E01B1B
    autocmd ColorScheme * highlight TodoRed   ctermbg=red guibg=#002b37 ctermfg=LightMagenta guifg=#E0841B
    autocmd ColorScheme * highlight TodoYellow   ctermbg=yellow guibg=#002b37 ctermfg=red  guifg=#E0841B
endif


set background=dark
"let g:solarized_termcolors=256
"colorscheme herald
colorscheme solarized

filetype plugin indent on "Enable filetype-specific indenting and plugins

augroup myfiletypes
    " Clear old autocmds in group
    autocmd!
    " autoindent with two spaces, always expand tabs
    autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END

:set cpoptions+=$

" new ones
" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
set showcmd
set autoindent
" set foldmethod=indent
" set expandtab
" set smarttab
set mouse=a
set nohidden
set noerrorbells
set visualbell
" handle long lines correctly
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85
" show invisibile characters -> getting used to
" set list
" set listchars=tab:▸\ ,eol:¬
" navigate by screen line
nnoremap j gj
nnoremap k gk
" remap fold tag
nnoremap <leader>ft Vatzf

" autosave on lost focus
au FocusLost * :wa

"for Zend phtml files
"autocmd BufEnter *.phtml set syn=php

if has("autocmd")
    if v:version > 701
        autocmd Syntax * call matchadd('TodoDarkRed',  '\W\zs\(TODO1\)')
        autocmd Syntax * call matchadd('TodoRed', '\W\zs\(TODO2\)')
        autocmd Syntax * call matchadd('TodoYellow', '\W\zs\(TODO3\)')
    endif
endif

" supertab + snipmate
"set completeopt = menu,menuone,longest
"set pumheight = 15
" let g:SuperTabDefaultCompletionType = "context"

nnoremap <leader>a :Ack
nnoremap <F5> :GundoToggle<CR>
" font settings
set guifont=Inconsolata\ 11
