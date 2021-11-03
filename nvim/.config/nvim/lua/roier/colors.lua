vim.g.material_style = "palenight"

require("nebulous").setup {
  variant = "fullmoon",
  custom_colors = { -- this table can hold any group of colors with their respective values
    LineNr = { fg = "#5eacd3", bg = "NONE", style = "NONE" },
    CursorLineNr = { fg = "#E1CD6C", bg = "NONE", style = "NONE" },

    -- it is possible to specify only the element to be changed
    TelescopePreviewBorder = { fg = "#A13413" },
    LspDiagnosticsDefaultError = { bg = "#E11313" },
    TSTagDelimiter = { style = "bold,italic" },
  }
}


vim.cmd('colorscheme nebulous')
