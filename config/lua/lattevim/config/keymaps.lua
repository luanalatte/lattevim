-- set space as leader
vim.g.mapleader = " "

local map = vim.keymap.set

map("n", "<C-s>", "<cmd>w<cr>", { desc = "Save File" })
map({ "i", "x", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
