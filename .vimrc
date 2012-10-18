set nocompatible
syntax on
set encoding=utf-8

" Important must have options
set hidden
set wildmenu
set showcmd
set hlsearch

" Usability options
set ignorecase
set smartcase
" set autoindent
"set cindent
set cmdheight=2
set number

" Indentations
"set shiftwidth=2
"set softtabstop=2
"set tabstop=4
"set softtabstop=4
"set noexpandtab

" Backup
set swapfile
set backupdir=~/.vim/backup

" gvim
if has("gui_running")
	set guifont=Monospace\ 8
	set lines=50
	set columns=100
	colorscheme desert
else
	set background=dark
endif

""""""
" Sage settings (from Franco Saliola)
autocmd BufRead,BufNewFile *.sage,*.pyx,*.spyx set filetype=python
autocmd Filetype python set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType python set makeprg=sage\ -b\ &&\ sage\ -t\ %

" Latex settings
"map ,p :!pdflatex % & 
"map ,b :!bibtex % & 
"map ,v :!evince %<.pdf & 
"map ,t :w !pdflatex % & 

setlocal makeprg=pdflatex\ \-file\-line\-error\ \-interaction=nonstopmode\ $*\\\|\ grep\ \-E\ '\\w+:[0-9]{1,4}:\\\ ' 
setlocal errorformat=%f:%l:\ %m 
map <buffer> <F5> :w<CR>:make %<<CR> 
map <buffer> <F6> :!bibtex %<<CR>
map <buffer> <F7> :!evince %<.pdf &<CR> 
map <F9> :cprev<CR> 
map <F10> :cnext<CR> 
map <F11> :clist<CR> 
