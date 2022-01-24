local capabilities = vim.lsp.protocol.make_client_capabilities()

local function on_attach()
  -- 
end

--local updated_capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.tsserver.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

require'lspconfig'.vuels.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

require'lspconfig'.ccls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}
