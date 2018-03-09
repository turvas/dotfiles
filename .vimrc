execute pathogen#infect()

set showmatch
set expandtab
set tabstop=4
set shiftwidth=4
set ruler
set et
set ignorecase
set ch=2  "vim command line height
syntax on
set hlsearch
highlight Normal guibg=grey80
highlight Cursor guibg=Green
set bs=2
set autoindent
set number 
set laststatus=2
set ruler
set ignorecase
set smartcase
set history=1000

colors Tomorrow-Night-Bright

nmap \| :NERDTreeFind<CR>
nmap <Bslash> :NERDTreeToggle<CR>
nmap ,/ <plug>NERDCommenterToggle
vmap ,/ <plug>NERDCommenterToggle
