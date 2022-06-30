local nmap = require("roier.keymap").nmap
local imap = require("roier.keymap").imap
local vmap = require("roier.keymap").vmap

local silent = { noremap = true, silent = true}

-- Navigation
nmap { '<leader>ee', ':Ex<CR>', silent }
nmap { '<leader>ev', ':Vex<CR>', silent }
nmap { '<S-q>', ':bd<CR>', silent }
nmap { '<leader>l', ':bn<CR>', silent }
nmap { '<leader>h', ':bp<CR>', silent }
nmap { '<leader>tl', ':tabnext<CR>', silent }
nmap { '<leader>th', ':tabprevious<CR>', silent }

-- Remaps
nmap { 'Y', 'y$', { noremap = true } }
nmap { 'n', 'nzzzv', { noremap = true } }
nmap { 'N', 'Nzzzv', { noremap = true } }
nmap { 'J', 'mzJ`z', { noremap = true } }

-- Moving text
nmap { '<leader>j', ':m .+1<CR>==', { noremap = true } }
nmap { '<leader>k', ':m .-2<CR>==', { noremap = true } }
vmap { 'J', ':m \'>+1<CR>gv=gv', { noremap = true } }
vmap { 'K', ':m \'<-2<CR>gv=gv', { noremap = true } }

-- Undo breakpoints
imap { ',', ',<C-g>u', { noremap = true } }
imap { '.', '.<C-g>u', { noremap = true } }
imap { ';', ';<C-g>u', { noremap = true } }
imap { '[', '[<C-g>u', { noremap = true } }
imap { '!', '!<C-g>u', { noremap = true } }
imap { '?', '?<C-g>u', { noremap = true } }

-- Clipboard
nmap { '<leader>y', '"+y', { noremap = true } }
vmap { '<leader>y', '"+y', { noremap = true } }
vmap { '<leader>p', '"_dP', { noremap = true } }
nmap { '<leader>Y', 'gg"+yG', { noremap = true } }

-- Comment 
vmap { '++', ':CommentToggle<CR>', { noremap = false, silent = true } }
nmap { '++', ':CommentToggle<CR>', { noremap = false, silent = true } }

-- Telescope
nmap { '<C-p>', '<cmd>lua require(\'telescope.builtin\').git_files()<cr>', silent }
nmap { '<leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>', silent }
nmap { '<leader>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>', silent }
nmap { '<leader>fm', '<cmd>lua require(\'telescope.builtin\').keymaps()<cr>', silent }

-- Neogit mapping
nmap { '<C-g>', '<cmd>lua require("neogit").open({ kind = "split_above" })<cr>', silent }



-- LSP
-- TODO: do when LSP is ready


-- Sessionizer
nmap { '<C-f>', ':silent !tmux neww tmux-sessionizer<CR>', silent}

-- Format with prettier
nmap { '<leader>F', ':Prettier<CR>', { noremap = true, silent = false } }

-- Luasnip
-- TODO: Do it at final because we need to implement a better stuff
