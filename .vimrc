" ~/.vimrc (configuration file for vim only)

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim

autocmd BufNewFile	*.spec	call SKEL_spec()
" filetypes
filetype plugin on
filetype indent on

nmap <silent> <C-d> :NERDTreeToggle<CR>
imap <silent> <C-d> :NERDTreeToggle<CR>
" ~/.vimrc ends here
set hidden
set tabstop=4
set autoindent
set number
set shiftwidth=4
set copyindent
set shiftround
set showmatch
set ignorecase
set smarttab
"don't beep
set visualbell
set noerrorbells
"undo level
set undolevels=1000
set title

"noob help
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

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

"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized

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
set foldmethod=indent
set autoindent
"set expandtab
"set smarttab
set mouse=a
" highlight things that are found in a search
" set hlsearch
set nohidden
set noerrorbells
set visualbell

"for Zend phtml files
autocmd BufEnter *.phtml set syn=php

" color definitions
if !exists("autocmd_colorscheme_loaded")
    let autocmd_colorscheme_loaded = 1
    autocmd ColorScheme * highlight TodoDarkRed      ctermbg=darkred guibg=#002b37 ctermfg=LightRed     guifg=#E01B1B
    autocmd ColorScheme * highlight TodoRed   ctermbg=red guibg=#002b37 ctermfg=LightMagenta guifg=#E0841B
    autocmd ColorScheme * highlight TodoYellow   ctermbg=yellow guibg=#002b37 ctermfg=red  guifg=#E0841B
endif
colorscheme herald

if has("autocmd")
    if v:version > 701
        autocmd Syntax * call matchadd('TodoDarkRed',  '\W\zs\(TODO1\)')
        autocmd Syntax * call matchadd('TodoRed', '\W\zs\(TODO2\)')
        autocmd Syntax * call matchadd('TodoYellow', '\W\zs\(TODO3\)')
    endif
endif

"jslint integration
nmap <F4> :w<CR>:make<CR>:cw<CR>

" supertab + snipmate
"set completeopt = menu,menuone,longest
"set pumheight = 15
" let g:SuperTabDefaultCompletionType = "context"
