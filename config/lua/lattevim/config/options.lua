-- true colors
vim.opt.termguicolors = true

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = false

-- indentation
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true

vim.opt.list = true -- show some invisible characters (like tabs)

vim.opt.clipboard = "unnamedplus"

-- status and cmdline
vim.o.cmdheight = 0
vim.o.laststatus = 3

require("vim._core.ui2").enable()
