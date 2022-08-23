vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

local hl = function(thing, opts)
  vim.api.nvim_set_hl(0, thing, opts)
end

require('colorbuddy').colorscheme('catppuccin')

hl("LineNr", { fg = "#5BBBDA", bg = "NONE" })
hl("CursorLineNr", { fg = "#E1CD6C", bg = "NONE" })
