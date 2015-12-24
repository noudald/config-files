set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Folding code, the correct way.
Plugin 'tmhedberg/SimpylFold'

" Indent python
Plugin 'vim-scripts/indentpython.vim'

" Auto completion
Plugin 'Valloric/YouCompleteMe'

" Syntax checking
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
let python_highlight_all=1

" The NERD Tree
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Git integration
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

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

" Python identation
"au BufNewFile,BufRead *.py, *.sage
"    \ set tabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix

" Identation for javascript, html and css
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Latex settings
autocmd BufRead,BufNewFile *.tex 
    \ set tabstop=2
    \ set shiftwidth=2
    \ set expandtab
    \ set iskeyword+=_,:,-

" Flagging unnecessary whitespaces
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Ensure the autocomplete windows goews away when you're done with it.
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


set encoding=utf-8
syntax on
set nu " Line numbers
set clipboard=unnamed " Copy to general clipboard

"set nocompatible
"let g:tex_comment_nospell= 1
"set spell spelllang=en_us
"syntax on
"set encoding=utf-8
"
"set iskeyword+=:
"set iskeyword+=_
"set iskeyword+=.
"
"" Important must have options
"set hidden
"set wildmenu
"set showcmd
"set hlsearch
"
"" Usability options
"set ignorecase
"set smartcase
"" set autoindent
""set cindent
"set cmdheight=2
"set number
"
"" Indentations
""set shiftwidth=2
""set softtabstop=2
""set tabstop=4
""set softtabstop=4
""set noexpandtab
"
"" gvim
"if has("gui_running")
"	set guifont=Monospace\ 8
"	set lines=50
"	set columns=100
"	colorscheme desert
"else
"	set background=dark
"endif
"
"" go to the position I was when last editing the file
"au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif
"
"
"""""""
"" Sage settings (from Franco Saliola)
"autocmd BufRead,BufNewFile *.sage,*.pyx,*.spyx set filetype=python
"autocmd Filetype python set tabstop=4|set shiftwidth=4|set expandtab
"autocmd FileType python set makeprg=sage\ -b\ &&\ sage\ -t\ %
"
"" Latex settings
"autocmd BufRead,BufNewFile *.tex set tabstop=2|set shiftwidth=2|set expandtab|set iskeyword+=_,:,-
"
"" Javascript settings
"autocmd BufRead,BufNewFile *.html set tabstop=2|set shiftwidth=2|set expandtab
"autocmd BufRead,BufNewFile *.js set tabstop=2|set shiftwidth=2|set expandtab
"
"" php settings
"autocmd BufRead,BufNewFile *.php set tabstop=4|set shiftwidth=2|set expandtab
"
