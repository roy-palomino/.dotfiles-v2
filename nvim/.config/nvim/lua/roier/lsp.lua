local capabilities = vim.lsp.protocol.make_client_capabilities()

local function on_attach()
  -- 
end

capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.tsserver.setup{ on_attach = on_attach }
