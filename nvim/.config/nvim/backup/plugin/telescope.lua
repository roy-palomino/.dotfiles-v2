local tele_themes = require'telescope.themes'

local function base_opts(opts)
  local _opts = tele_themes.get_dropdown {
    winblend = 35,
    previewer = false,
    border = true,
    max_height = 0.9,

  }
  return vim.tbl_deep_extend("force", _opts, opts)
end

local gf_opts = base_opts {}

local ff_opts = base_opts {
  find_command = { "rg", "--ignore", "--hidden", "--files", "--unrestricted" },
}

require('telescope').setup{
  pickers = {
    git_files = gf_opts,
    find_files = ff_opts,
  },
}
