set wildmode=longest,list,full
set wildmenu

set encoding=UTF-8

:let mapleader = " "

set nocompatible              " required vundle
filetype off                  " required vundle

" backspace that actually works everywhere.
" see:
" https://vi.stackexchange.com/questions/2162/why-doesnt-the-backspace-key-work-in-insert-mode
set backspace=indent,eol,start

" with tmux, ctrl+ mapping was not working.
" it does thanks to this set.
" see: https://stackoverflow.com/questions/16638962/sending-ctrl-right-to-vim-inside-tmux
set term=xterm-256color

"============================================================
" Plugins with Vundle.
"============================================================

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" snippets
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
"let g:UltiSnipsExpandTrigger="<tab>"

" themes
Plugin 'ajmwagar/vim-deus'
Plugin 'tssm/fairyfloss.vim'
Plugin 'jaredgorski/spacecamp'
Plugin 'jacoborus/tender.vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'morhetz/gruvbox'
Plugin 'ghifarit53/tokyonight-vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'kaicataldo/material.vim', { 'branch': 'main' }
" ayu theme seems amazing but does not work on my laptop...
Plugin 'ayu-theme/ayu-vim', { 'name': 'ayu' }
Plugin 'junegunn/seoul256.vim'
Plugin 'mhartington/oceanic-next'
Plugin 'embark-theme/vim', { 'name': 'embark' }

Plugin 'rakr/vim-two-firewatch'

Plugin 'sheerun/vim-polyglot'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" nice to have.
Plugin 'mattn/emmet-vim'
Plugin 'alvan/vim-closetag'
Plugin 'scrooloose/nerdtree'
" does not work on my laptop, weird characters instead of logos.
 Plugin 'ryanoasis/vim-devicons'
Plugin 'kien/ctrlp.vim'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'editorconfig/editorconfig-vim'
Plugin 'mg979/vim-visual-multi', {'branch': 'master'}
Plugin 'preservim/tagbar'

" Languages specific things to install.
Plugin 'fatih/vim-go'

" really fast fuzzy finder
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" fzf respect .gitignore file by using ag.
" got from: https://github.com/junegunn/fzf.vim/issues/121
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" In normal mode, press Space to toggle the current fold open/closed. However, if the cursor is not in a fold, move to the right (the default behavior).
" from: https://vim.fandom.com/wiki/Folding
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf


"============================================================
" Settings
"============================================================

" press F2 before and after past code.
" -> https://stackoverflow.com/a/2514520
set pastetoggle=<F2>
syntax on

set smartindent
set shiftwidth=4 " number of spaces when shift indenting
set tabstop=4 " number of visual spaces per tab
"set softtabstop=4 " number of spaces in tab when editing
set expandtab " tab to spaces

set showcmd " print the mapleader key to the bottom right hand corner when it's active.
set number " show line numbers
set cursorline  " highlight current line
set cursorcolumn
set showmatch " highlight matching [{()}]
set incsearch " search as characters are entered
set hlsearch " highlight matches
set foldmethod=syntax " folds with language syntax

" when folding is enabled the default settings will fold all blocks by default.
" To start with unfolded content we can set
set foldlevelstart=20

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
" it's the delay to trigger plugins after you stopped writting.
set updatetime=400
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " autoquit if only nerdtree is open (1 file open, :q file quit. by default is would stay only with nerdtree).

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*.pyc


"============================================================
" Theming
"============================================================
"let g:seoul256_background = 256
"color seoul256-light

"colorscheme spacecamp
"colorscheme deus
colorscheme fairyfloss
let g:airline_theme='fairyfloss'

"color dracula
"colorscheme sourlick-contrast
"colorscheme nord
"colorscheme OceanicNext
"colorscheme material
"colorscheme embark
"
"set background=dark
"colo two-firewatch
"let g:two_firewatch_italics=1
"let g:airline_theme='twofirewatch'

let g:material_terminal_italics = 1
let g:material_theme_style = 'palenight'
"let g:tokyonight_style = 'storm' " available: night, storm
"let g:tokyonight_enable_italic = 1
"set t_Co=256
"set background=light
"colorscheme PaperColor

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
    set termguicolors
endif

" dark or light for gruvbox
"set background=light
"colorscheme gruvbox
"colorscheme tokyonight
"colorscheme tender
"let g:airline_theme = 'tender'

" airline
"let g:airline_theme = 'seoul256'
"let g:airline_theme = 'gruvbox'
"let g:airline_theme = 'material'

let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#branch#enabled = 1
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

" emmet plugin shortcut
let g:user_emmet_leader_key='<C-E>'

" move between buffers
nnoremap <Leader>q :bprevious<CR>
nnoremap <Leader>d :bnext<CR>
nnoremap <Leader>z :bfirst<CR>
nnoremap <Leader>s :blast<CR>

" close all buffers except the opened one
" explain: https://stackoverflow.com/a/42071865
map <leader>o :%bd\|e#<cr>

" list of buffers
nnoremap <C-m> :ls<CR>

" switch to left / right split (mostly for Nerd Tree)
map <C-h> <C-W>h
map <C-l> <C-W>l

"============================================================
" mapping to move line
" basically: ctrl+j ctrl+k
" see:https://vim.fandom.com/wiki/Moving_lines_up_or_down
"============================================================
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Nerd Tree toggling
map <leader>w :NERDTreeToggle<CR>
let g:NERDTreeIgnore = ['^node_modules$', '\.pyc$']

" map Ctrl+u to redo
nnoremap <C-u> :redo<CR>

"============================================================
" Quickfix list
"============================================================
nnoremap ]q :cnext<CR>
nnoremap [q :cprev<CR>

nnoremap <leader>k :lnext<CR>zz
nnoremap <leader>j :lprev<CR>zz

nnoremap <C-q> :call ToggleQFList(1)<CR>
"nnoremap <leader>q :call ToggleQFList(0)<CR>

let g:the_primeagen_qf_l = 0
let g:the_primeagen_qf_g = 0

fun! ToggleQFList(global)
    if a:global
        if g:the_primeagen_qf_g == 1
            let g:the_primeagen_qf_g = 0
            cclose
        else
            let g:the_primeagen_qf_g = 1
            copen
        end
    else
        if g:the_primeagen_qf_l == 1
            let g:the_primeagen_qf_l = 0
            lclose
        else
            let g:the_primeagen_qf_l = 1
            lopen
        end
    endif
endfun


"============================================================
" Coc configuration
"============================================================
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" Use <Tab> and <S-Tab> to navigate the completion list:
" https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources#use-tab-and-s-tab-to-navigate-the-completion-list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"map to split
" vim default is <C-w> s (horizontal) and <C-w> v (vertical)
nnoremap ,v <C-w>v
nnoremap ,h <C-w>s

"map resizing buffers
noremap <C-w>+ :resize +10<CR>
noremap <C-w>- :resize -10<CR>
noremap <C-w>< :vertical:resize -10<CR>
noremap <C-w>> :vertical:resize +10<CR>

"============================================================
" Golang configuration
"============================================================
autocmd BufEnter *.go nmap <leader>t  <Plug>(go-test)
autocmd BufEnter *.go nmap <leader>tt <Plug>(go-test-func)
autocmd BufEnter *.go nmap <leader>c  <Plug>(go-coverage-toggle)
autocmd BufEnter *.go nmap <leader>i  <Plug>(go-info)
autocmd BufEnter *.go nmap <leader>ii  <Plug>(go-implements)
autocmd BufEnter *.go nmap <leader>ci  <Plug>(go-describe)
autocmd BufEnter *.go nmap <leader>cc  <Plug>(go-callers)
autocmd BufEnter *.go nmap <leader>cs  <Plug>(go-callstack)

" map turning off highlighting after search and closing quickfix window
nnoremap <Esc><Esc> :noh<CR>:ccl<CR>

"============================================================
" fugitive configuration
"============================================================
nmap <leader>gb :Gblame<CR>
nmap <leader>gr :Gread<CR>
nmap <leader>gw :Gwrite<CR>
nmap <leader>gd :tabe<CR>:Gdiffsplit<CR>
nmap <leader>gs :tabe<CR>:Gstatus<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gl :tabe %<CR>:Glog -- %<CR>

"============================================================
" Perl configuration
"============================================================
" can't make fold works. Let's do it the old way. Not perfect, but it works.
autocmd FileType perl set foldmarker={,} foldmethod=marker

"============================================================
" YAML configuration
"============================================================
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"============================================================
" Python configuration
" https://code.djangoproject.com/wiki/UsingVimWithDjango
"============================================================
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4
