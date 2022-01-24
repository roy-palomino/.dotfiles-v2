P = function(v)
  print(vim.inspect(v))
  return v
end

if pcall(require, 'plenary') then
  RELOAD = require('plenary.reload').reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end

-- Python provider
--vim.g.python3_host_prog = '/home/roier/nvim-venv/bin/python'



-- vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.tab_complete()', {expr = true, noremap = false})
-- vim.api.nvim_set_keymap('s', '<Tab>', 'v:lua.tab_complete()', {expr = true, noremap = false})
-- vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true, noremap = false})
-- vim.api.nvim_set_keymap('s', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true, noremap = false})
