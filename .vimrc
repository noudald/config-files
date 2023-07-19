set nocompatible

syntax on

set tabstop=4       " A tab is 4 spaces
set shiftwidth=4    " Auto indent is always 4 spaces
set softtabstop=4   " When hitting backspace, pretend like a tab is removed
set expandtab       " Expand tabs to spaces
set autoindent      " Always use auto indenting
set background=dark " Use light text with dark background
set laststatus=2    " Always show status line in last window
set hlsearch        " Highlight search terms
set incsearch       " Show search matches as you type

" Set tab to 2 spaces for javascript
autocmd FileType javascript setlocal ts=2 sts=2 sw=2

" Finding files (fuzzy finding)
set path+=**
set wildmenu

" File browsing
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" Show trailing white spaces
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/

" Store backup files in separate folder
set directory=~/.vim/backups
set backup
set swapfile
