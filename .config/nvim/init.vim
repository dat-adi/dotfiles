" -----------------------------------------
"        _       _                   _ _ 
"       | |     | |                 | (_)
"     __| | __ _| |_ ______ __ _  __| |_ 
"    / _` |/ _` | __|______/ _` |/ _` | |
"   | (_| | (_| | |_      | (_| | (_| | |
"    \__,_|\__,_|\__|      \__,_|\__,_|_|
" 
" -----------------------------------------
"
"         Instagram : dat.adithya
"            GitHub : @dat-adi
"
" -----------------------------------------

" --- Syntax Highlighting --- "
syntax on

" --- Normal VIM Settings --- "
set encoding=utf-8
set ts=4
set noerrorbells
set shiftwidth=4
set expandtab
set smartindent
set rnu
set nowrap
set smartcase
set noswapfile
set incsearch
set foldmethod=indent
set foldlevel=99

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" --- Plugins --- "
call plug#begin()

Plug 'pangloss/vim-javascript'

Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf.vim', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'vim-airline/vim-airline'

call plug#end()

" --- General Settings --- "
let mapleader = ","

" --- Gruvbox Settings --- "
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection = '0'

colorscheme gruvbox
set background=dark

" --- JavaScript Settings --- "
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

" --- General Mappings --- "
map <leader>h :noh<CR>

" --- Restriction Remaps --- "
noremap <UP> <NOP>
noremap <DOWN> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>

" --- Plugin Mappings --- "
nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Gpush<CR>

nnoremap <space> za

" --- THE END --- "
