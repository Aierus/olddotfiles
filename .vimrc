set laststatus=2 " lightline config setting
syntax on
colo gruvbox
set t_Co=256
set bg=dark
set number
if $SSH_CONNECTION
    colorscheme gruvbox 
endif
set guifont=Terminus:12

" set tab size
set tabstop=4
set shiftwidth=4
set expandtab

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'ghifarit53/tokyonight-vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/promptline.vim'
Plug 'jmcantrell/vim-virtualenv'
Plug 'tpope/vim-fugitive'
Plug 'vim-syntastic/syntastic'
Plug 'preservim/nerdcommenter'

Plug 'vim-python/python-syntax'
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

