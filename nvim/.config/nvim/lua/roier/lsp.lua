local cmp_nvim = require'cmp_nvim_lsp'

local capabilities = cmp_nvim.update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

local function on_attach()
    -- TODO: Implement Telescopic stuff
end

-- End completation configuration

-- make capabilities a function?
-- require'lspconfig'.pylsp.setup{
--   capabilities = capabilities,
--   cmd = { "pylsp" },
--   filetypes = { "python" }
-- }
require'lspconfig'.gopls.setup{
  capabilities = capabilities,
  cmd = { "gopls" }
}
require'lspconfig'.tsserver.setup{
  capabilities = capabilities,
  on_attach = on_attach
}
require'lspconfig'.ccls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

require'lspconfig'.vuels.setup{
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = { "vls" },
    filetypes = { "vue" },
    init_options = {
      config = {
        vetur = {
          completion = {
            autoImport = false,
            tagCasing = "kebab",
            useScaffoldSnippets = false
          },
          format = {
            scriptInitialIndent = false,
            styleInitialIndent = false
          },
          useWorkspaceDependencies = false,
          validation = {
            script = true,
            style = true,
            template = true
          }
        }
      }
    }
}

-- Vim lsp
require'lspconfig'.vimls.setup{
  capabilities = capabilities,
  cmd = { 'vim-language-server', '--stdio' }
}

-- Lua lsp
-- https://github.com/tjdevries/nlua.nvim/pull/10
require'nlua.lsp.nvim'.setup(require'lspconfig', {
  capabilities = capabilities,
  cmd = {
    '/usr/bin/lua-language-server',
    '-E',
    '/usr/lib/lua-language-server/main.lua'
  },
  diagnostics = {
    disable = {"lowercase-global"}
  }
})

local opts = {
    -- whether to highlight the currently hovered symbol
   -- disable if your cpu usage is higher than you want it
    -- or you just hate the highlight
    -- default: true
    highlight_hovered_item = true,

    -- whether to show outline guides
    -- default: true
    show_guides = true,
}

require('symbols-outline').setup(opts)
