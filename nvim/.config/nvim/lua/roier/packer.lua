return require('packer').startup(function(use)

    -- LSP config
    use 'onsails/lspkind.nvim'

    use {'williamboman/nvim-lsp-installer'}

    -- Nvim-cmp packages
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    -- Snippets packages
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'

    use 'tjdevries/colorbuddy.nvim'

    use 'nvim-lua/plenary.nvim'

    use {'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim'}

    use({'catppuccin/nvim', as = 'catppuccin'})

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    -- TREE NAVIGATION
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons' -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    use {'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'}}

    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/playground'

    use 'kyazdani42/nvim-web-devicons'

    -- Comment packages
    use 'terrortylor/nvim-comment'
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    use 'lukas-reineke/indent-blankline.nvim'

    -- Dart & Flutter support
    -- use 'thosakwe/vim-flutter'
    use 'dart-lang/dart-vim-plugin'
    use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}

    -- Formatting
    use 'sbdchd/neoformat'

    -- Completion for lua
    use 'tjdevries/nlua.nvim'
    use 'nvim-lua/completion-nvim'

    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'

end)
