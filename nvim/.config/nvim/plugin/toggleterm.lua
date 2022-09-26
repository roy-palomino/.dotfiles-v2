require('toggleterm').setup {
  on_open = function(term)
    -- vim.cmd("startinsert!")
    -- vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<Esc>", "<C-\\><C-h>", { noremap = true })

    -- Send <Esc> when toggling term
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<esc>', true, false, true), 'm', true)
  end,
  start_in_insert = true,
  open_mapping = [[<M-h>]],  -- <C-T> seted in maps
  hide_numbers = false,
  winbar = {
    enabled = true,
    name_formatter = function(term)
      return term.name
    end,
  },
}
