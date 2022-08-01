filetype plugin on
set showmatch
set expandtab
set ruler
syntax on
set hlsearch
colorscheme kalev
" Disable swapping files in the same directory as edited file,
" mostly for editing files mounted with Docker
" and swapping causes inode change and breaks update in container
" @see https://stackoverflow.com/a/15317146/842480
" IMPORTANT: directories must exist, so create them!
:set backupdir=~/.vim/backup/
:set directory=~/.vim/swap/
:set undodir=~/.vim/undo/
