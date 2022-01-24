local opt = vim.opt

opt.syntax = "on"
opt.ignorecase = true
opt.termguicolors = true
opt.smarttab = true
opt.cindent = true
opt.expandtab = true
opt.shiftwidth = 2

opt.number = true
opt.relativenumber = true

opt.backup = false
opt.undofile = true
opt.tabstop = 4
opt.softtabstop = 4
opt.hlsearch = false
opt.hidden = true
opt.swapfile = false
opt.scrolloff = 8
opt.cursorline = true
opt.guicursor = ""
opt.signcolumn = "yes"

vim.cmd('set undodir=~/.vim/undodir')
vim.cmd('set encoding=utf-8')
--vim.cmd('set signcolumn=yes')

