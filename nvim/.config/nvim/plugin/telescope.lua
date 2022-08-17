local tele_themes = require'telescope.themes'
local fb_actions = require "telescope".extensions.file_browser.actions


local function base_opts(opts)
  local _opts = tele_themes.get_dropdown {
    winblend = 35,
    previewer = false,
    border = true,
    max_height = 0.9,

  }
  return vim.tbl_deep_extend("force", _opts, opts)
end

local function browser_opts(opts) 
  local _opts = tele_themes.get_dropdown {
    winblend = 10,
    width = 0.5,
    prompt = " ",
    results_height = 25,
    layout_config = {
      width = 80,
      height = 20,
    },
    previewer = false,
  }
  return vim.tbl_deep_extend("force", _opts, opts)
end

local gf_opts = base_opts {}

local ff_opts = base_opts {
  find_command = { "rg", "--ignore", "--hidden", "--files", "--unrestricted" },
}

local fb_opts = browser_opts {
  initial_mode = "normal",
  grouped = true,
  hijack_netrw = false,
  cwd_to_path = true,
  mappings = {
    ["i"] = {
      ["<C-h>"] = fb_actions.goto_cwd,
    },
    ["n"] = {
      ["~"] = fb_actions.goto_cwd,
      ["-"] = fb_actions.goto_parent_dir,
    },
  },
}

require('telescope').setup{
  pickers = {
    git_files = gf_opts,
    find_files = ff_opts,
  },
  extensions = {
    file_browser = fb_opts,
  },
}

require("telescope").load_extension "file_browser"
