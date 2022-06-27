return require('packer').startup(function(use)
  use {
    "TimUntersberger/neogit",
    requires = "nvim-lua/plenary.nvim"
  }

  use "tjdevries/colorbuddy.nvim"

  use({
    "catppuccin/nvim",
    as = "catppuccin"
  })

end)
