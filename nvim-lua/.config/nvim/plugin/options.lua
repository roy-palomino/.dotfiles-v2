local o = vim.o
local bo = vim.bo

o.syntax = "on"
o.ignorecase = true
o.smarttab = true
o.cindent = true
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2

o.number = true
o.relativenumber = true

o.hlsearch = false
o.hidden = true
o.swapfile = false
o.scrolloff = 8
o.guicursor = ""
o.signcolumn = "yes"
o.colorcolumn = "88"
o.signcolumn = "yes"
o.termguicolors = true

o.backup = false
o.undofile = true
o.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.cmd('highlight ColorColumn guibg=DarkCyan')

-- Set tabstop for different languages
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python" },
  callback = function()
    vim.schedule(function()
      print("set tabstop = 8")
      bo.tabstop = 8
      bo.shiftwidth = 8
    end)
  end,
})
