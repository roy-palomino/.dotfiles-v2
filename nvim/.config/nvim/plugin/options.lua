local o = vim.o
local bo = vim.bo

o.syntax = "on"
o.ignorecase = true

-- tabs
o.smarttab = true
o.autoindent = true
o.cindent = true
o.expandtab = true
o.shiftwidth = 2
o.breakindent = true
o.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
o.linebreak = true
o.tabstop = 2
o.softtabstop = 2
o.expandtab = true
o.wrap = true
o.cursorline = true

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

o.belloff = "all"

o.mouse = "n"

o.backup = false
o.undofile = true
o.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.cmd('highlight ColorColumn guibg=DarkCyan')

-- Set tabstop for different languages, currently just python
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python" },
  callback = function()
    vim.schedule(function()
      bo.shiftwidth = 8
      bo.tabstop = 8
      bo.softtabstop = 8
    end)
  end,
})
