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

local api = vim.api

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
