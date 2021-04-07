set encoding=UTF-8

set nocompatible              " required vundle
filetype off                  " required vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'scrooloose/nerdtree'
" does not work on my laptop, weird characters instead of logos.
" Plugin 'ryanoasis/vim-devicons'
Plugin 'kien/ctrlp.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

" Python
" Plugin 'nvie/vim-flake8'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"============================================================
" mxmaxime settings
"============================================================
syntax on
set smartindent
color dracula
set number " show line numbers
set cursorline  " highlight current line
set showmatch " highlight matching [{()}]
set incsearch " search as characters are entered
set hlsearch " highlight matches

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " autoquit if only nerdtree is open (1 file open, :q file quit. by default is would stay only with nerdtree).

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*.pyc

" airline
let g:airline_theme = 'dracula'
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline_left_sep = ' ❤  '
let g:airline_right_sep = ' 🟆  '
let g:airline_section_warning = ''
let g:airline_section_y = ''
let g:airline_section_x = ''
set laststatus=2 " for airline

"============================================================
" Mappings
"============================================================
" ctrl-p plugin shortcut
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" move between buffers
map <C-Left> <Esc>:bprev<CR>
map <C-Right> <Esc>:bnext<CR>

" Nerd Tree toggling
map <C-q> :NERDTreeToggle<CR>

let g:NERDTreeIgnore = ['^node_modules$', '\.pyc$']
