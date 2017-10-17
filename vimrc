"    __  __       _         __     ___                                  _
"   |  \/  | __ _| | _____  \ \   / (_)_ __ ___     __ _ _ __ ___  __ _| |_
"   | |\/| |/ _` | |/ / _ \  \ \ / /| | '_ ` _ \   / _` | '__/ _ \/ _` | __|
"   | |  | | (_| |   <  __/   \ V / | | | | | | | | (_| | | |  __/ (_| | |_
"   |_|  |_|\__,_|_|\_\___|    \_/  |_|_| |_| |_|  \__, |_|  \___|\__,_|\__|
"                                                  |___/
"                                           _       _
"                          __ _  __ _  __ _(_)_ __ | |
"                         / _` |/ _` |/ _` | | '_ \| |
"                        | (_| | (_| | (_| | | | | |_|
"                         \__,_|\__, |\__,_|_|_| |_(_)
"                               |___/


set nocompatible

" Plugin management (I use Vundle) {{{1
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" Plugin sources {{{2
Plugin 'gmarik/Vundle.vim'
Plugin 'michalbachowski/vim-wombat256mod'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-endwise'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'ihacklog/HiCursorWords'
Plugin 'lodifice/omnitags.vim'
Plugin 'lodifice/pathfinder.vim'
Plugin 'lodifice/guillotine.vim'
Plugin 'lodifice/panzer.vim'
Plugin 'kien/ctrlp.vim'
"Plugin 'jiangmiao/auto-pairs'
Plugin 'kdrakon/AnswerSetProgramming-VIM-Syntax-Highlighting'
Plugin 'vim-scripts/DoxygenToolkit.vim'
" }}}2
call vundle#end()
" }}}1

filetype plugin indent on
syntax on

" General config {{{1
" Disable swapping {{{2
set nobackup
set nowritebackup
set noswapfile
" }}}2
" Tabs and spaces {{{2
set expandtab       " expand tabs to spaces
set tabstop=4       " each tab is 4 spaces
set shiftwidth=4    " use 4 spaces for each indent level
set shiftround      " orientate indent on shiftwidth
" }}}2
" Search {{{2
set hlsearch        " always highlight search results
set incsearch       " search incrementally
set ignorecase      " ignore case when searching
set smartcase       " ignore ignorecase when uppercase letter in search string
" }}}2
" History & undo levels
set history=777     " command line history
set undolevels=777  " normal mode history
" Buffer management {{{2
set hidden          " Make it possible to switch buffers without writing
" }}}2
" }}}1

" Completion {{{1
set completeopt=menu,preview
autocmd CompleteDone * pclose
"}}}1

" Visuals {{{1
" Orientation {{{2
set number
set relativenumber
set ruler
set scrolloff=2     " number of lines always below/above cursor"
" }}}2
" Color scheme {{{2
set t_Co=256
color wombat256mod                  " TODO fork wombat
highlight LineNr ctermbg=234
highlight TabLineFill ctermfg=234
highlight Search ctermbg=none
" }}}2
" }}}1

" Plugin configuration {{{1
" Guillotine {{{2
augroup guillotine
    autocmd!
    autocmd BufEnter * if exists(":ToggleHeaderSource") | execute "nmap <buffer> ga :ToggleHeaderSource<cr>" | endif
augroup END
" }}}2
" }}}1

" Mouse and Backspace
set mouse=a

set colorcolumn=100
highligh ColorColumn ctermbg=233

" Showing tabs
set list
set listchars=tab:\ \ ,trail:·

set clipboard=unnamedplus

nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>

" remove trailing shit
autocmd FileType c,cpp,java,php,python,tex autocmd BufWritePre <buffer> :%s/\s\+$//e

" tell syntastic where to find headers
let g:syntastic_c_include_dirs = [ 'include', 'inc' ]
let g:syntastic_cpp_include_dirs = [ 'include', 'inc' ]

" tell syntastic to check header files
let g:syntastic_cpp_check_header = 1

" display up to 25 tabpages
set tabpagemax=25
