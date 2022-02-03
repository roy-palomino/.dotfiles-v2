syntax on

" TODO: Migrate this to lua file
call plug#begin('~/.vim/plugged')

" LSP plugins
Plug 'neovim/nvim-lspconfig'
" Completation plugins

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'L3MON4D3/LuaSnip'
Plug 'onsails/lspkind-nvim'

" Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'

" Color schemes
Plug 'tjdevries/colorbuddy.nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'Yagua/nebulous.nvim'

Plug 'norcalli/nvim-colorizer.lua'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" go.nvim dependencies
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'

" Plug 'crispgm/nvim-go'
" Plug 'ray-x/go.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Lua plugins
Plug 'tjdevries/nlua.nvim'

" Helpers
Plug 'terrortylor/nvim-comment'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'lukas-reineke/indent-blankline.nvim'

" Status bottom bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" File explorer
" Plug 'kyazdani42/nvim-tree.lua'

call plug#end()

lua require("roier")
lua require("roier.editor")
lua require("roier.lsp")
lua require("roier.completion")

let mapleader = " "
