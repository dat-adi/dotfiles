-- This package consists of the packages that need to be installed by the
-- Lazy.nvim package manager (https://github.com/folke/lazy.nvim)

-- Initial bootstrap code to install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
local plugins = {
  -- color scheme
  {
	  'rose-pine/neovim',
      lazy = false, -- make sure to load during startup
      priority = 1000,
	  config = function()
          -- loading the color scheme here
		  vim.cmd('colorscheme rose-pine')
	  end,
  },


  -- Git and version control
  'tpope/vim-fugitive',

  -- File navigation and changes
  {
	  'nvim-telescope/telescope.nvim',
      tag = '0.1.0',
	  dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  'nvim-treesitter/nvim-treesitter',
  'theprimeagen/harpoon',
  'mbbill/undotree',

  -- Tmux
  'preservim/vimux',

  -- LSP Support
  'neovim/nvim-lspconfig',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',

  -- Autocompletion
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',

  -- Snippets
  'L3MON4D3/LuaSnip'
}

local opts = {}

-- Setting up lazy.nvim for plugin management
require("lazy").setup(plugins, opts)
