filetype plugin on
set showmatch
set expandtab
set ruler
set background=dark
syntax on
set hlsearch
colors kalev
let g:gruvbox_italic=1
let g:gruvbox_termcolors=16
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
let g:indentLine_char = '⦙'
" Disable swapping files in the same directory as edited file,
" mostly for editing files mounted with Docker 
" and swapping causes inode change and breaks update in container
" @see https://stackoverflow.com/a/15317146/842480
" IMPORTANT: directories must exist, so create them!
:set backupdir=~/.vim/backup/
:set directory=~/.vim/swap/
:set undodir=~/.vim/undo/
