if &compatible
  " Vim defaults to `compatible` when selecting a vimrc with the command-line
  " `-u` argument. Override this.
  set nocompatible
endif
set laststatus=2 
syntax on
colo gruvbox
set t_Co=256
set bg=dark
set number
if $SSH_CONNECTION
    colorscheme gruvbox 
endif

" etc
set ignorecase

" set tab size
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

call plug#begin('~/.vim/plugged')

" often used color themes
Plug 'morhetz/gruvbox'
Plug 'ghifarit53/tokyonight-vim'

" status bar and git plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/promptline.vim'
Plug 'jmcantrell/vim-virtualenv'
Plug 'tpope/vim-fugitive'

" comment plugins
Plug 'tpope/vim-commentary'

" writing plugins
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'godlygeek/tabular'

" syntax plugins
Plug 'vim-python/python-syntax'
Plug 'vim-syntastic/syntastic'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'rust-lang/rust.vim'
Plug 'tomlion/vim-solidity'

call plug#end()

" airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 

" python highlight all
let g:python_highlight_all = 1

" promptline config
let g:promptline_preset = {
    \'a' : [ promptline#slices#host({ 'only_if_ssh': 1}) ],
    \'b' : [ promptline#slices#python_virtualenv() ],
    \'c' : [ promptline#slices#cwd({ 'dir_limit': 2}) ],
    \'y' : [ promptline#slices#vcs_branch() ],
    \'warn' : [ promptline#slices#last_exit_code() ]}

set noshowmode " remove redundancy
