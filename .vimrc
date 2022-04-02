set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'vim-scripts/indentpython.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'timonv/vim-cargo'
Plugin 'yuezk/vim-js'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/syntastic'
Plugin 'loremipsum'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set tabstop=4
set shiftwidth=4
set expandtab

let python_highlight_all=1
syntax on

set laststatus=2
set hlsearch

" set background color
if has("gui_running")
	set guifont=Monospace\ 8
	set lines=50
	set columns=100
	colorscheme desert
else
	set background=dark
endif

" Finding files (fuzzy finding)
set path+=**
set wildmenu

" Tag jumping
command! MakeTags !ctags -R .

" File browsing
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" Rusty tags
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/

" Set tab to 2 spaces for javascript
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
