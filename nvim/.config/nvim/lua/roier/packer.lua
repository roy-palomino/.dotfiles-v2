return require('packer').startup(function(use)

  use 'tjdevries/colorbuddy.nvim'

  use 'nvim-lua/plenary.nvim'

  use {
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim'
  }

  use({
    'catppuccin/nvim',
    as = 'catppuccin'
  })

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'}
    }
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'kyazdani42/nvim-web-devicons'

  -- Comment packages
  use 'terrortylor/nvim-comment'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  use 'lukas-reineke/indent-blankline.nvim'

end)
