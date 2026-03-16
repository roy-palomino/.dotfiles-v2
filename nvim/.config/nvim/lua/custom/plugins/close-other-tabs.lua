-- Close other tabs/buffers functionality
-- Closes all buffers except the current one (skips modified buffers)

local function close_other_tabs()
  local current_buf = vim.api.nvim_get_current_buf()
  local buffers = vim.api.nvim_list_bufs()

  for _, buf in ipairs(buffers) do
    if buf ~= current_buf and vim.api.nvim_buf_get_option(buf, 'modified') == false then
      vim.api.nvim_buf_delete(buf, {})
    end
  end
end

-- Create the user command
vim.api.nvim_create_user_command('CloseOtherTabs', close_other_tabs, {})

-- Keybinding: <leader>bo for "buffer only" (keep only this buffer)
vim.keymap.set('n', '<leader>bo', ':CloseOtherTabs<CR>', { noremap = true, silent = true, desc = 'Close all other [B]uffers, keep [O]nly current' })

return {}
