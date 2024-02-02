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
    -- use {
    --     "NeogitOrg/neogit",
    --     requires = {
    --         "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim",
    --         "sindrets/diffview.nvim", "ibhagwan/fzf-lua"
    --     }
    -- }

    use({'catppuccin/nvim', as = 'catppuccin'})

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    -- TREE NAVIGATION
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'},
        tag = 'nightly'
    }

    use {'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'}}

    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/playground'

    use 'kyazdani42/nvim-web-devicons'

    -- Comment packages
    use 'terrortylor/nvim-comment'
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- use "lukas-reineke/indent-blankline.nvim"

    -- Dart & Flutter support
    -- use 'thosakwe/vim-flutter'
    -- use 'dart-lang/dart-vim-plugin'
    use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}

    -- Formatting
    use 'sbdchd/neoformat'

    -- Completion for lua
    use 'tjdevries/nlua.nvim'
    use 'nvim-lua/completion-nvim'

    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'

    -- Terminal toggler
    use {
        "akinsho/toggleterm.nvim",
        tag = '*',
        config = function() require("toggleterm").setup() end
    }

    use {"folke/todo-comments.nvim", requires = {"nvim-lua/plenary.nvim"}}

    -- Markdown stuff
    -- install without yarn or npm

    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = {"markdown"} end,
        ft = {"markdown"}
    })

    use {
        "vinnymeller/swagger-preview.nvim",
        run = "npm install -g swagger-ui-watcher"
    }

    use 'nvim-treesitter/nvim-treesitter-context'

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use {
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim", "antoinemadec/FixCursorHold.nvim",
            "haydenmeade/neotest-jest"
        }
    }
    use "folke/neodev.nvim"

end)
