-- Neogit - Magit for Neovim
-- https://github.com/NeogitOrg/neogit

return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
  cmd = 'Neogit',
  keys = {
    { '<C-g>', '<cmd>Neogit<cr>', desc = 'Open Neogit' },
    { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Neo[g]it [G]it status' },
    { '<leader>gc', '<cmd>Neogit commit<cr>', desc = '[G]it [C]ommit' },
    { '<leader>gp', '<cmd>Neogit pull<cr>', desc = '[G]it [P]ull' },
    { '<leader>gP', '<cmd>Neogit push<cr>', desc = '[G]it [P]ush' },
    { '<leader>gb', '<cmd>Neogit branch<cr>', desc = '[G]it [B]ranch' },
    { '<leader>gl', '<cmd>Neogit log<cr>', desc = '[G]it [L]og' },
  },
  opts = {
    disable_insert_on_commit = true,
    graph_style = 'unicode',
    kind = 'tab',
    commit_editor = {
      kind = 'tab',
      show_staged_diff = true,
    },
    signs = {
      hunk = { '', '' },
      item = { '>', 'v' },
      section = { '>', 'v' },
    },
    integrations = {
      telescope = true,
      diffview = true,
    },
  },
}
