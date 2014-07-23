" ~/.vimrc (configuration file for vim only)
call pathogen#runtime_append_all_bundles()
filetype plugin indent on
call pathogen#helptags()

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
set undofile " unlimited undos with .un~ files
set visualbell "don't beep
set noerrorbells
set title
set ignorecase
set smartcase
set wildmenu
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

"let &statusline="%< %f %{fugitive#statusline()} ... (When I grow up, I'd like to be dangerous.)"
"navigation helper
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"for sudo purpose
cmap w!! w !sudo tee % >/dev/null
set pastetoggle=<F2>
:filetype plugin on

filetype plugin indent on "Enable filetype-specific indenting and plugins

augroup myfiletypes
    " Clear old autocmds in group
    autocmd!
    " autoindent with two spaces, always expand tabs
    autocmd FileType ruby,eruby,yaml,js,ts set ai sw=2 sts=2 et
augroup END

:set cpoptions+=$

" new ones
" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" recognize typescript files
autocmd BufRead,BufNewFile *.ts set filetype=typescript

" 72 columns to commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

set showcmd
set autoindent
"set foldmethod=indent
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
"set colorcolumn=85

" show invisibile characters -> getting used to
set list
set listchars=tab:▸\ ,eol:¬

" navigate by screen line
nnoremap j gj
nnoremap k gk

" autosave on lost focus
au FocusLost * :wa

" compile less files straight to css
" nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>

"for Zend phtml files
"autocmd BufEnter *.phtml set syn=php

call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
            \ 'ignore_pattern', join([
            \ '\.git/',
            \ '\**/node_modules/',
            \ '\**/bower_components/',
            \ '\**/steal/',
            \ '\**/target/',
            \ '\**/assets/js',
            \ '\**/logs/',
            \ '\**/highlight/',
            \ '\**/tmp/',
            \ '\**/dist/',
            \ '\**/.tmp/',
            \ '\**/.sw\*/',
            \ '\**/.sass-cache/',
            \ '\**/.tscache/',
            \ '\**/.un\~/',
            \ '\**/.grunt/',
            \ ], '\|'))

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

nnoremap <C-p> :Unite -no-split -buffer-name=files -start-insert file_rec/async:.<cr>
nnoremap <space>/ :Unite grep:.<cr>
nnoremap <space>e :Unite -no-split -buffer-name=buffer -quick-match buffer<cr>

"let mapleader = "," " used for ack
"nnoremap <leader>a :Ack
"replaced with Unite at least for the moment

nnoremap <F5> :GundoToggle<CR>

syntax on
filetype off
filetype on

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

set t_Co=256
set background=dark
"let g:solarized_termcolors=256
"colorscheme distinguished
"colorscheme herald
"colorscheme Tomorrow-Night-Bright
"colorscheme Tomorrow-Night
"colorscheme Tomorrow
"colorscheme hemisu
"colorscheme Tomorrow-Night-Eighties
"colorscheme seoul256
colorscheme herald
"colorscheme hybrid
"colorscheme vimbrant
highlight ColorColumn ctermbg=7
highlight ColorColumn guibg=Gray

if &term =~ "xterm" || &term =~ "screen"
    set ttymouse=xterm2
    autocmd VimEnter,FocusGained,BufEnter * set ttymouse=xterm2
endif
