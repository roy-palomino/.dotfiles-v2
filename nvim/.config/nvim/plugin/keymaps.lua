local nmap = require("roier.keymap").nmap
local imap = require("roier.keymap").imap
local vmap = require("roier.keymap").vmap

local ls = require("luasnip")

local silent = { noremap = true, silent = true}

-- Navigation
nmap { '<leader>e', ':NvimTreeToggle<CR>', silent }
nmap { '<S-q>', ':bd<CR>', silent }
nmap { '<Tab>', ':BufferNext<CR>', silent }
nmap { '<S-Tab>', ':BufferPrevious<CR>', silent }
nmap { '<leader>tmh', ':BufferMovePrevious<CR>', silent }
nmap { '<leader>tml', ':BufferMoveNext<CR>', silent }

-- Remaps
nmap { 'Y', 'y$', { noremap = true } }
nmap { 'n', 'nzzzv', { noremap = true } }
nmap { 'N', 'Nzzzv', { noremap = true } }
nmap { 'J', 'mzJ`z', { noremap = true } }
imap { '<C-p>', '<Up>', { noremap = true } }
imap { '<C-n>', '<Down>', { noremap = true } }

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
nmap { '<M-BS>', '<cmd>lua require(\'telescope.builtin\').git_files()<cr>', silent }
nmap { '<C-p>', '<cmd>lua require(\'telescope.builtin\').git_files()<cr>', silent }
nmap { '<leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>', silent }
nmap { '<leader>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>', silent }
nmap { '<leader>fm', '<cmd>lua require(\'telescope.builtin\').keymaps()<cr>', silent }

-- LSP mapping
nmap { '<leader>gd', ':lua vim.lsp.buf.definition()<CR>', silent }
nmap { '<leader>gD', ':lua vim.lsp.buf.declaration()<CR>', silent }
nmap { '<leader>gi', ':lua vim.lsp.buf.implementation()<CR>', silent }
nmap { '<leader>gr', ':lua vim.lsp.buf.references()<CR>', silent }
nmap { '<leader>sh', ':lua vim.lsp.buf.signature_help()<CR>', silent }
nmap { '<leader>rn', ':lua vim.lsp.buf.rename()<CR>', silent }
nmap { '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>', silent }
nmap { '<leader>sd', '<cmd>lua vim.diagnostic.open_float()<CR>', silent }
nmap { '<leader>[d', ':lua vim.lsp.diagnostic.goto_prev()<CR>', silent }
nmap { '<leader>]d', ':lua vim.lsp.diagnostic.goto_next()<CR>', silent }
-- nmap { 'F', ':lua vim.lsp.buf.formatting()<CR>', { noremap = true } }
nmap { 'K', ':lua vim.lsp.buf.hover()<CR>', silent }

-- Neogit mapping
nmap { '<C-g>', '<cmd>lua require("neogit").open({ kind = "split_above" })<cr>', silent }


-- Sessionizer
nmap { '<C-f>', ':silent !tmux neww tmux-sessionizer<CR>', silent}

-- Format with prettier
nmap { '<leader>F', ':Neoformat<CR>', { noremap = true, silent = false } }

-- Packer maps
nmap { '<leader><leader>ps', ':PackerSync<CR>', silent }
nmap { '<leader><leader>pc', ':PackerClean<CR>', { noremap = true, silent = false } }
nmap { '<leader><leader>pu', ':PackerUpdate<CR>', silent }

nmap { '<leader><leader>s', '<cmd>source ~/.config/nvim/plugin/luasnip.lua<CR>', silent }

vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

imap {'<C-l>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, silent}

-- Flutter stuff

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "netrw", "log" },
  callback = function()
    vim.schedule(function()
      nmap { '<leader>fR', '<cmd>FlutterRun<CR>', silent }
      nmap { '<leader>fq', '<cmd>FlutterQuit<CR>', silent }
      nmap { '<C-l>', '<cmd>FlutterLogClear<CR>', silent }
    end)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "dart" },
  callback = function()
    vim.schedule(function()
      nmap { '<leader>fR', '<cmd>FlutterRun<CR>', silent }
      nmap { '<leader>fQ', '<cmd>FlutterQuit<CR>', silent }
      nmap { '<leader>fo', '<cmd>FlutterOutlineToggle<CR>', silent }
      nmap { '<leader>frs', '<cmd>FlutterRestart<CR>', silent }
      nmap { '<leader>frl', '<cmd>FlutterReload<CR>', silent }
      nmap { '<leader>fvd', '<cmd>FlutterVisualDebug<CR>', silent }
      nmap { '<leader>fe', '<cmd>FlutterEmulators<CR>', silent }
    end)
  end,
})
