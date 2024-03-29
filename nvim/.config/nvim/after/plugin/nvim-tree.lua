require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  open_on_tab         = false,
  hijack_cursor       = true,
  sync_root_with_cwd  = false,
  hijack_directories  = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  filters = {
    dotfiles = false,
  },
  view = {
    width = 50,
    height = 30,
    hide_root_folder = false,
    side = 'right',
    mappings = {
      custom_only = false,
      list = {
        { key = "-", action = "dir_up" },
      }
    }
  },
  actions = {
    open_file = {
      resize_window = false
    }
  }
}
