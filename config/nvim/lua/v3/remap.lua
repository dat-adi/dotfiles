-- This file is in-charge of setting up the various remaps required
-- for the configuration.

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>.", vim.cmd.Ex)

-- pastes and keeps the pasted stuff in the void register
vim.keymap.set("x", "<leader>p", "\"_dP")

-- selects the region and places it into your system paygrade
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+y")
