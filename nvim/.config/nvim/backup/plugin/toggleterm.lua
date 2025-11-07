require('toggleterm').setup {
  on_open = function(term)
    -- Map <Esc> to return to normal mode in terminal buffers
    -- vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<esc>", "<C-\\><C-n>", { noremap = true })

    -- Send <Esc> when toggling term
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<esc>', true, false, true), 'm', true)
  end,
  hide_numbers = true,
  start_in_insert = true,
  persist_mode = true,
  insert_mappings = true,
  open_mapping = [[<M-h>]],  -- <C-T> seted in maps
  hide_numbers = false,
  direction = 'float',
  border = 'curved',
  winbar = {
    enabled = true,
    name_formatter = function(term)
      return term.name
    end,
  },
}
