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

-- Global options
vim.g.noswapfile = true
vim.g.noerrorbells = true
vim.g.nowrap = true
vim.g.mapleader = ","
vim.g.signcolumn = "yes"

-- Appearance
vim.wo.relativenumber = true
vim.wo.number = true
vim.wo.colorcolumn = "120"
vim.o.encoding = "utf-8"
vim.o.ts = 2
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

-- Diagonistics
vim.g.updatetime = 300

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
api.nvim_set_keymap("n", "<C-d>", [[<cmd>lua require('telescope.builtin').lsp_definitions()<CR>]], {noremap = true, silent = true})

-- Lsp keybindings
--> Code navigation shortcuts
api.nvim_set_keymap("n", "<c-]>", [[<cmd>lua vim.lsp.buf.definition()<CR>]], {noremap = true, silent = true})
api.nvim_set_keymap("n", "K", [[<cmd>lua vim.lsp.buf.hover()<CR>]], {noremap = true, silent = true})
api.nvim_set_keymap("n", "gD", [[<cmd>lua vim.lsp.buf.implementation()<CR>]], {noremap = true, silent = true})
api.nvim_set_keymap("n", "<c-k>", [[<cmd>lua vim.lsp.buf.signature_help()<CR>]], {noremap = true, silent = true})
api.nvim_set_keymap("n", "1gD", [[<cmd>lua vim.lsp.buf.type_definition()<CR>]], {noremap = true, silent = true})
api.nvim_set_keymap("n", "gr", [[<cmd>lua vim.lsp.buf.references()<CR>]], {noremap = true, silent = true})
api.nvim_set_keymap("n", "g0", [[<cmd>lua vim.lsp.buf.document_symbol()<CR>]], {noremap = true, silent = true})
api.nvim_set_keymap("n", "gW", [[<cmd>lua vim.lsp.buf.workspace_symbol()<CR>]], {noremap = true, silent = true})
api.nvim_set_keymap("n", "gd", [[<cmd>lua vim.lsp.buf.definition()<CR>]], {noremap = true, silent = true})

--> Code action
api.nvim_set_keymap("n", "ga", [[<cmd>lua vim.lsp.buf.code_action()<CR>]], {noremap = true, silent = true})

--> Diagnostics
api.nvim_set_keymap("n", "g[", [[<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>]], {noremap = true, silent = true})
api.nvim_set_keymap("n", "g]", [[<cmd>lua vim.lsp.diagnostic.goto_next()<CR>]], {noremap = true, silent = true})
