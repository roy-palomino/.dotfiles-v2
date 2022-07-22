-- Icons setup
local dev_icons = require'nvim-web-devicons'
local indent_blankline = require'indent_blankline'

dev_icons.setup {
  default = true
}

indent_blankline.setup {
  space_char_blankline = " ",
  show_current_context = true,
}
