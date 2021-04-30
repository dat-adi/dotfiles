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

" --- Plugins --- "
call plug#begin()

    Plug 'pangloss/vim-javascript'

    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/fzf.vim', { 'do': { -> fzf#install() } }
    Plug 'ap/vim-css-color'

    Plug 'sainnhe/gruvbox-material'
    Plug 'vim-airline/vim-airline'
    Plug 'ryanoasis/vim-devicons'
    Plug 'vim-python/python-syntax'

    Plug 'gruvbox-community/gruvbox'
    Plug 'romgrk/doom-one.vim'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'junegunn/vim-emoji'
    Plug 'arcticicestudio/nord-vim'

call plug#end()

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
set spell
set nowrap
set smartcase
set noswapfile
set incsearch
set foldmethod=indent
set foldlevel=99
"set colorcolumn=80
"highlight ColorColumn ctermfg=none ctermbg=236 cterm=none

" --- General Settings --- "
let mapleader = ","

" --- Gruvbox Settings --- "
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection='0'

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

" --- Resize Remaps --- "
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" --- Plugin Mappings --- "
nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Gpush<CR>

nmap <leader>f :Files<CR>

nnoremap <space> za

" --- THE END --- "
