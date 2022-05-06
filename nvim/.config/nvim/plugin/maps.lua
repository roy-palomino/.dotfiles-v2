local set_keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- cmp.mapping.close(),
-- set_keymap('i', '<C-c>', '<cmd>cmp.mapping.close()<CR>', opts)

-- Base maps
set_keymap('n', '<leader><CR>', ':source ~/.config/nvim/init.lua<CR>', { noremap = true })
-- set_keymap('n', '<leader>w', ':w<CR> :edit<CR>', { noremap = true })
-- set_keymap('n', '<leader>W', ':wa<CR> :edit<CR>', { noremap = true, silent = true })

-- Navigation
set_keymap('n', '<leader>ee', ':Ex<CR>', { noremap = true })
set_keymap('n', '<leader>ev', ':Vex<CR>', { noremap = true })
set_keymap('n', '<S-q>', ':bd<CR>', { noremap = true })
set_keymap('n', '<leader>l', ':bn<CR>', { noremap = true })
set_keymap('n', '<leader>h', ':bp<CR>', { noremap = true })
set_keymap('n', '<leader>tl', ':tabnext<CR>', { noremap = true })
set_keymap('n', '<leader>th', ':tabprevious<CR>', { noremap = true })

-- Remaps
set_keymap('n', 'Y', 'y$', { noremap = true })
set_keymap('n', 'n', 'nzzzv', { noremap = true })
set_keymap('n', 'N', 'Nzzzv', { noremap = true })
set_keymap('n', 'J', 'mzJ`z', { noremap = true })

-- Moving text
set_keymap('n', '<leader>j', ':m .+1<CR>==', { noremap = true })
set_keymap('n', '<leader>k', ':m .-2<CR>==', { noremap = true })
set_keymap('i', '<C-j>', '<esc>:m .+1<CR>==', { noremap = true })
set_keymap('i', '<C-k>', '<esc>:m .-2<CR>==', { noremap = true })
set_keymap('v', 'J', ':m \'>+1<CR>gv=gv', { noremap = true })
set_keymap('v', 'K', ':m \'<-2<CR>gv=gv', { noremap = true })

-- Undo breakpoints
set_keymap('i', ',', ',<C-g>u', { noremap = true })
set_keymap('i', '.', '.<C-g>u', { noremap = true })
set_keymap('i', ';', ';<C-g>u', { noremap = true })
set_keymap('i', '[', '[<C-g>u', { noremap = true })
set_keymap('i', '!', '!<C-g>u', { noremap = true })
set_keymap('i', '?', '?<C-g>u', { noremap = true })

-- Clipboard
set_keymap('n', '<leader>y', '"+y', { noremap = true })
set_keymap('v', '<leader>y', '"+y', { noremap = true })
set_keymap('v', '<leader>p', '"_dP', { noremap = true })
set_keymap('n', '<leader>Y', 'gg"+yG', { noremap = true })

-- Telescope
set_keymap('n', '<C-p>', '<cmd>lua require(\'telescope.builtin\').git_files()<cr>', opts)
set_keymap('n', '<leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>', opts)
set_keymap('n', '<leader>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>', opts)
set_keymap('n', '<leader>fm', '<cmd>lua require(\'telescope.builtin\').keymaps()<cr>', opts)

-- Git
set_keymap('n', '<C-g>', ':Git<CR>', opts)

-- LSP
set_keymap('n', '<leader>gd', ':lua vim.lsp.buf.definition()<CR>', opts)
set_keymap('n', '<leader>gD', ':lua vim.lsp.buf.declaration()<CR>', opts)
set_keymap('n', '<leader>gi', ':lua vim.lsp.buf.implementation()<CR>', opts)
set_keymap('n', '<leader>gr', ':lua vim.lsp.buf.references()<CR>', opts)
set_keymap('n', '<leader>sh', ':lua vim.lsp.buf.signature_help()<CR>', opts)
set_keymap('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>', opts)
set_keymap('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>', opts)
set_keymap('n', '<leader>sd', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
set_keymap('n', '<leader>[d', ':lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
set_keymap('n', '<leader>]d', ':lua vim.lsp.diagnostic.goto_next()<CR>', opts)
set_keymap('n', 'F', ':lua vim.lsp.buf.formatting()<CR>', { noremap = true })
set_keymap('n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)

-- Comment
set_keymap('v', '++', ':CommentToggle<CR>', { noremap = false, silent = true })
set_keymap('n', '++', ':CommentToggle<CR>', { noremap = false, silent = true })

-- Sessionizer
set_keymap('n', '<C-f>', ':silent !tmux neww tmux-sessionizer<CR>', opts)

set_keymap('n', '<leader>F', ':Prettier<CR>', { noremap = true, silent = false })

set_keymap('i', '<C-k>', "<cmd>lua require('luasnip').jump(1)<CR>", {})
set_keymap('n', '<leader><leader>s', '<cmd>source ~/.config/nvim/plugin/snippets.lua<CR>', { noremap = true })
