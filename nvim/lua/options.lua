--------------------
-- EDITOR OPTIONS --
--------------------

vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

vim.o.expandtab = true
vim.o.shiftwidth = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
vim.o.linebreak = true
vim.o.scrolloff = 1
vim.o.autoindent = true
vim.o.cc = 80
vim.o.mouse = 'a'

vim.o.confirm = true

vim.o.termguicolors = true

vim.o.ttyfast = true

vim.api.nvim_command("filetype plugin on")
vim.api.nvim_command("filetype indent on")

vim.o.swapfile = false

vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.completeopt = "menu,menuone,noselect"

vim.o.signcolumn = "auto"
