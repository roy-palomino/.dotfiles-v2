vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

  -- LSP config
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  -- use 'tamago324/cmp-zsh'

  use 'L3MON4D3/LuaSnip'
  use 'onsails/lspkind-nvim'

  -- Color schemes
  use 'tjdevries/colorbuddy.vim'
  use 'marko-cerovac/material.nvim'
  use 'Yagua/nebulous.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/playground'
  use 'lukas-reineke/indent-blankline.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
    'crispgm/nvim-tabline',
    config = function()
        require('tabline').setup({})
    end,
  })

  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  use 'digitaltoad/vim-pug'

end)
