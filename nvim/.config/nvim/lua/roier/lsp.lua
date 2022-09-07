local cmp_nvim = require'cmp_nvim_lsp'

local lspconfig = require('lspconfig')

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

lspconfig.tsserver.setup{
  capabilities = capabilities,

}

lspconfig.vimls.setup{
  capabilities = capabilities,
  cmd = { 'vim-language-server', '--stdio' }
}

-- lspconfig.dartls.setup{
--   capabilities = capabilities,
--   filetypes = {
--     "dart",
--     "flutter",
--   }
-- }

lspconfig.ccls.setup {
  capabilities = capabilities,
  filatypes = { "c", "cpp", "objc", "objcpp" },
  init_options = {
    compilationDatabaseDirectory = "build";
    index = {
      threads = 0;
    };
    clang = {
      excludeArgs = { "-frounding-math"} ;
    };
  }
}

lspconfig.volar.setup {
  capabilities = capabilities,
  init_options = {
    typescript = {
      serverPath = '~/.local/share/nvim/lsp_servers/tsserver'
    }
  },
  filetypes = {
    'typescript',
    'javascript',
    'javascriptreact',
    'typescriptreact',
    'vue',
    'json',
    'html'
  }
}

lspconfig.tailwindcss.setup{}

lspconfig.html.setup {
  capabilities = capabilities,
  filetypes = {
    'typescript',
    'javascript',
    'javascriptreact',
    'typescriptreact',
    'vue',
    'json',
    'html'
  }
}

require'nlua.lsp.nvim'.setup(require'lspconfig', {
  on_init = custom_init,
  capabilities = capabilities,
  cmd = {
    '/usr/bin/lua-language-server',
    '-E',
    '/usr/lib/lua-language-server/main.lua'
  },
  diagnosticls = {
    globals = {'vim'}
  },
  telemetry = {
    enable = false,
  },
  -- completion = {
  --   "keywordSnippet": "Disable",
  -- },
})
