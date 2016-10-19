set nocompatible              " be iMproved, required
filetype off                  " required

set backspace=indent,eol,start

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'rking/ag.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/nerdtree'
Plugin 'ap/vim-css-color'
Plugin 'chrisbra/NrrwRgn'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Shutnik/jshint2.vim'
Plugin 'krisajenkins/vim-projectlocal'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-abolish'

" Autocmpletion plugin. After install, must execute:
" sudo apt-get install build-essential cmake
" sudo apt-get install python-dev
" cd ~/.vim/bundle/YouCompleteMe
" ./install.py --tern-completer
"Plugin 'Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

if has("syntax")
  syntax on
  colorscheme ron
endif
set number
set t_Co=256

" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>

let g:monokai_italic = 1
let g:monokai_thick_border = 1
let jshint2_read = 1

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

set background=dark

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=i		" Enable mouse usage (all modes)
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
set ruler
set laststatus=2
set showtabline=2
"set foldmethod=syntax
set tabpagemax=30

set encoding=utf-8
set fileencoding=utf-8
set ff=unix
set eol

" remove trailing whitespace
autocmd FileType *,!md autocmd BufWritePre <buffer> :%s/\s\+$//e

set exrc
set secure

au BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=handlebars
au BufRead,BufNewFile *.tpl set filetype=smarty
au Filetype smarty exec('set dictionary=~/.vim/syntax/smarty.vim')
au Filetype smarty set complete+=k

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_auto_jump = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

" Disable slow scanning of buffer.
" TODO: look if Syntastic is calling RefreshSigns for every error during a
" scan.
let g:syntastic_enable_signs=0

" Disable slow cursor movement.
" TODO: see if better autocmd than cursormoved or something with a delay
" because it is slow if there are a lot of errors.
let g:syntastic_echo_current_error=0

autocmd BufWritePre * StripWhitespace

set lazyredraw

let g:syntastic_html_tidy_ignore_errors=[
    \'proprietary attribute ',
    \'trimming empty <',
    \'is not recognized!',
    \'discarding unexpected',
    \'unescaped &',
    \'<form> lacks "action"',
    \'has invalid value',
    \'escaping malformed URI'
\]

function! HasConfigFile(file, dir)
    return findfile(a:file, escape(a:dir, ' ') . ';') !=# ''
endfunction

autocmd BufNewFile,BufReadPre *.js  let b:syntastic_checkers =
    \ HasConfigFile('.jshintrc', expand('<amatch>:h')) ? ['jshint'] :
    \ HasConfigFile('.eslintrc', expand('<amatch>:h')) ? ['eslint'] :
    \     ['standard']

