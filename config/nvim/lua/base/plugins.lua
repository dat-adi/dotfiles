local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'ap/vim-css-color'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'glepnir/lspsaga.nvim'
Plug 'L3MON4D3/LuaSnip'

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
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

vim.call('plug#end')

Plug('nvim-treesitter/nvim-treesitter', {
    ['do'] = function()
	vim.cmd(':TSUpdate')
    end
})
