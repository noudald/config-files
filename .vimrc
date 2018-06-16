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
Plugin 'petRUShka/vim-sage'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

let python_highlight_all=1
syntax on

" Automatically reload files if changed
set autoread
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime

" Set 80 columns layout
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Indents are replaced by 4 spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd BufRead,BufNewFile /home/noud/work/mindsai/* setlocal ts=2 sw=2
autocmd BufRead,BufNewFile /home/noud/work/mindsai/* match OverLength /\%101v.\+/

set background=dark
set laststatus=2
set hlsearch

" Enable backups
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/backup
set writebackup

" set background color
if has("gui_running")
	set guifont=Monospace\ 8
	set lines=50
	set columns=100
	colorscheme desert
else
	set background=dark
endif
