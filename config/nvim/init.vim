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

    Plug 'ap/vim-css-color'
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'glepnir/lspsaga.nvim'

    Plug 'JoosepAlviste/palenightfall.nvim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'akinsho/toggleterm.nvim'

    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'junegunn/vim-emoji'

    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-ui-select.nvim'
    Plug 'glepnir/galaxyline.nvim'
    Plug 'simrat39/rust-tools.nvim'

    Plug 'tpope/vim-fugitive'
    Plug 'hrsh7th/nvim-compe'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'


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

" --- General Settings --- "
let mapleader = ","

" --- Color Settings --- "
" While I had gruvbox set in here a while ago,
" I'm using the palenightfall in lua now.

" --- General Mappings --- "
map <leader>h :noh<CR>
tnoremap <Esc> <C-\><C-n>

" --- Resize Remaps --- "
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" --- Plugin Mappings --- "
nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Gpush<CR>

nnoremap <space> za

" --- Lua Remaps --- "
" >> Checks buffers
nnoremap <leader>;      :lua require'telescope.builtin'.buffers{}<CR>

" >> Fzf the current buffer
nnoremap <leader>/      :lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>

" >> Access any file inside the git repo
nnoremap <leader>f      :lua require'telescope.builtin'.git_files(require('telescope.themes').get_ivy({}))<CR>

nnoremap <silent> gd    :Lspsaga preview_definition<CR>
nnoremap <silent> K     :Lspsaga hover_doc<CR>
nnoremap <silent> gn    :Lspsaga rename<CR>

" >> Go to the definition of the word
nnoremap <silent> <C-d>  :lua require'telescope.builtin'.lsp_definitions{}<CR>

lua << EOF
require("treesitter")
require("statusbar")
require("completion")
require("palenightfall").setup()
EOF

" --- THE END --- "
