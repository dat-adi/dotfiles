-------------------------------------------
--       _       _                   _ _
--      | |     | |                 | (_)
--    __| | __ _| |_ ______ __ _  __| |_
--   / _` |/ _` | __|______/ _` |/ _` | |
--  | (_| | (_| | |_      | (_| | (_| | |
--   \__,_|\__,_|\__|      \__,_|\__,_|_|
--
-------------------------------------------
--
--        Instagram : dat.adithya
--           GitHub : @dat-adi
--
-------------------------------------------

local vim = vim
local api = vim.api
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

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
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

vim.call('plug#end')

Plug('nvim-treesitter/nvim-treesitter', {
    ['do'] = function()
	vim.cmd(':TSUpdate')
    end
})

print("~yamete onee-sama~")

-- Global options
vim.g.noswapfile = true
vim.g.noerrorbells = true
vim.g.nowrap = true
vim.g.mapleader = ","

-- Appearance
vim.wo.relativenumber = true
vim.wo.number = true
vim.wo.colorcolumn = "120"
vim.o.encoding = "utf-8"
vim.o.ts = 4
vim.o.foldmethod = "indent"
vim.o.foldlevel = 99

-- Editing
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.spell = true
vim.o.smartcase = true
vim.o.incsearch = true

vim.cmd [[
  syntax enable
]]

-- Keybindings
api.nvim_set_keymap("n", "<leader>h", ":noh<CR>", {noremap = true, silent = true})
api.nvim_set_keymap("t", "<esc>", ":<C-\\><C-n><CR>", {noremap = true})
api.nvim_set_keymap("n", "<space>", "za<CR>", {noremap = true})

-- Resize Remaps
api.nvim_set_keymap("n", "<Left>", ":vertical resize +2<CR>", {noremap = true})
api.nvim_set_keymap("n", "<Right>", ":vertical resize -2<CR>", {noremap = true})

-- Fugitive Remaps
api.nvim_set_keymap("n", "<leader>gs", ":G<CR>", {noremap = true})
api.nvim_set_keymap("n", "<leader>gj", ":diffget //3<CR>", {noremap = true})
api.nvim_set_keymap("n", "<leader>gf", ":diffget //2<CR>", {noremap = true})
api.nvim_set_keymap("n", "<leader>gc", ":Gcommit<CR>", {noremap = true})
api.nvim_set_keymap("n", "<leader>gp", ":Gpush<CR>", {noremap = true})

-- Telescope
--> Checks buffers
api.nvim_set_keymap("n", "<leader>;", [[<cmd>lua require('telescope.builtin').buffers()<CR>]], {noremap = true, silent = true})

--> Fzf the current buffer
api.nvim_set_keymap("n", "<leader>/", [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], {noremap = true, silent = true})

--> Access any file inside the git repo
api.nvim_set_keymap("n", "<leader>f", [[<cmd>lua require('telescope.builtin').git_files(require('telescope.themes').get_ivy({}))<CR>]], {noremap = true, silent = true})

--> Go to the definition of the word
api.nvim_set_keymap("n", "<silent><C-d>", [[<cmd>lua require('telescope.builtin').lsp_definitions()<CR>]], {noremap = true, silent = true})

-- Lspsaga
--> Preview Definition
api.nvim_set_keymap("n", "<silent>gd", ":Lspsaga preview_definition<CR>", {noremap = true})

--> Hover Documentation
api.nvim_set_keymap("n", "<silent>K", ":Lspsaga hover_doc<CR>", {noremap = true})

--> Rename
api.nvim_set_keymap("n", "<silent>gn", ":Lspsaga rename<CR>", {noremap = true})

-- LSP
local saga = require 'lspsaga'
saga.init_lsp_saga()

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
    local opts = {
        tools = { -- rust-tools options
            -- Automatically set inlay hints (type hints)
            autoSetHints = true,

            -- Whether to show hover actions inside the hover window
            -- This overrides the default hover handler 
            hover_with_actions = true,

            -- how to execute terminal commands
            -- options right now: termopen / quickfix
            executor = require("rust-tools/executors").termopen,

            runnables = {
                -- whether to use telescope for selection menu or not
                use_telescope = true

                -- rest of the opts are forwarded to telescope
            },

            debuggables = {
                -- whether to use telescope for selection menu or not
                use_telescope = true

                -- rest of the opts are forwarded to telescope
            },

            -- These apply to the default RustSetInlayHints command
            inlay_hints = {

                -- Only show inlay hints for the current line
                only_current_line = false,

                -- Event which triggers a refersh of the inlay hints.
                -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
                -- not that this may cause  higher CPU usage.
                -- This option is only respected when only_current_line and
                -- autoSetHints both are true.
                only_current_line_autocmd = "CursorHold",

                -- wheter to show parameter hints with the inlay hints or not
                show_parameter_hints = true,

                -- prefix for parameter hints
                parameter_hints_prefix = "<- ",

                -- prefix for all the other hints (type, chaining)
                other_hints_prefix = "=> ",

                -- whether to align to the length of the longest line in the file
                max_len_align = false,

                -- padding from the left if max_len_align is true
                max_len_align_padding = 1,

                -- whether to align to the extreme right or not
                right_align = false,

                -- padding from the right if right_align is true
                right_align_padding = 7,

                -- The color of the hints
                highlight = "Comment",
            },

            hover_actions = {
                -- the border that is used for the hover window
                -- see vim.api.nvim_open_win()
                border = {
                    {"╭", "FloatBorder"}, {"─", "FloatBorder"},
                    {"╮", "FloatBorder"}, {"│", "FloatBorder"},
                    {"╯", "FloatBorder"}, {"─", "FloatBorder"},
                    {"╰", "FloatBorder"}, {"│", "FloatBorder"}
                },

                -- whether the hover action window gets automatically focused
                auto_focus = false
            },

            -- settings for showing the crate graph based on graphviz and the dot
            -- command
            crate_graph = {
                -- Backend used for displaying the graph
                -- see: https://graphviz.org/docs/outputs/
                -- default: x11
                backend = "x11",
                -- where to store the output, nil for no output stored (relative
                -- path from pwd)
                -- default: nil
                output = nil,
                -- true for all crates.io and external crates, false only the local
                -- crates
                -- default: true
                full = true,
            }
        },

        -- all the opts to send to nvim-lspconfig
        -- these override the defaults set by rust-tools.nvim
        -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
        server = {}, -- rust-analyer options

        -- debugging stuff
        dap = {
            adapter = {
                type = 'executable',
                command = 'lldb-vscode',
                name = "rt_lldb"
            }
        }
    }

    if server.name == "rust_analyzer" then
        -- Initialize the LSP via rust-tools instead
        require("rust-tools").setup {
            -- The "server" property provided in rust-tools setup function are the
            -- settings rust-tools will provide to lspconfig during init.            -- 
            -- We merge the necessary settings from nvim-lsp-installer (server:get_default_options())
            -- with the user's own settings (opts).
            server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
        }
        server:attach_buffers()
    else
        server:setup(opts)
    end
  end)

  require("treesitter")
  require("statusbar")
  require("completion")
  require("palenightfall").setup()
