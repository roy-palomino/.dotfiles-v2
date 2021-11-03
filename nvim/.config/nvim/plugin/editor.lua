vim.opt.list = true
vim.opt.listchars:append("eol:↲")

-- Vim Airline config
vim.g.airline_theme = 'minimalist'
vim.g.airline_powerline_fonts = 0
vim.g.airline_section_y = ''
vim.cmd('let g:airline#extensions#tabline#enabled = 1')
require('indent_blankline').setup {
  show_end_of_line = true,
  show_current_context = true,
}
