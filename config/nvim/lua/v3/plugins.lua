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
	  dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  'nvim-treesitter/nvim-treesitter',
  'mbbill/undotree',
  {
     "folke/trouble.nvim",
     dependencies = { "nvim-tree/nvim-web-devicons" },
     opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
     },
  },

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
  'L3MON4D3/LuaSnip',

  -- Go Assistance
  {
	  "ray-x/go.nvim",
	  dependencies = {
		  "ray-x/guihua.lua",
		  "neovim/nvim-lspconfig",
		  "nvim-treesitter/nvim-treesitter",
	  },
	  config = function()
		  require("go").setup()
	  end,
	  event = {"CmdlineEnter"},
	  ft = {"go", "gomod"},
  }
}

local opts = {}

-- Setting up lazy.nvim for plugin management
require("lazy").setup(plugins, opts)
