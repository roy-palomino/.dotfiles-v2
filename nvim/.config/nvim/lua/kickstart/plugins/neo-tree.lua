-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    'akinsho/bufferline.nvim', -- Buffer management
  },
  lazy = false,
  keys = {
    { '<leader>e', ':Neotree toggle position=right<CR>', desc = 'NeoTree toggle', silent = true },
    { '<Tab>', ':BufferLineCycleNext<CR>', desc = 'Next buffer', silent = true },
    { '<S-Tab>', ':BufferLineCyclePrev<CR>', desc = 'Previous buffer', silent = true },
    { '<S-q>', ':bdelete!<CR>', desc = 'Close buffer', silent = true },
    { '<leader>tmh', ':BufferLineMovePrev<CR>', desc = 'Move buffer left', silent = true },
    { '<leader>tml', ':BufferLineMoveNext<CR>', desc = 'Move buffer right', silent = true },
    { '<leader>q', ':CloseOtherTabs<CR>', desc = 'Close other buffers', silent = true },
  },
  opts = {
    window = {
      position = 'right',
    },
    filesystem = {
      window = {
        mappings = {
          ['<leader>e'] = 'close_window',
        },
      },
    },
  },
}
