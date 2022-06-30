local cmp_nvim = require'cmp_nvim_lsp'

local capabilities = cmp_nvim.update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

capabilities.textDocument.completion.completionItem.snippetSupport = true

local custom_init = function(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end

-- Used for auto install packages
require("nvim-lsp-installer").setup {}

-- Languages
require'lspconfig'.tsserver.setup{
  capabilities = capabilities
}
