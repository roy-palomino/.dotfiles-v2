local util = require 'lspconfig.util'
local cmp_nvim = require 'cmp_nvim_lsp'
local lspconfig = require('lspconfig')

local capabilities = cmp_nvim.default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

capabilities.textDocument.completion.completionItem.snippetSupport = true

local function get_typescript_server_path(root_dir)
  local project_root = util.find_node_modules_ancestor(root_dir)
  return project_root and (util.path.join(project_root, 'node_modules', 'typescript', 'lib')) or ''
end

-- https://github.com/johnsoncodehk/volar/blob/20d713b/packages/shared/src/types.ts
local volar_init_options = {
    typescript = {
        tsdk = '/home/roier/.nvm/versions/node/v18.16.0/lib/node_modules/typescript/lib',
    },
    languageFeatures = {
        references = true,
        definition = true,
        typeDefinition = true,
        callHierarchy = true,
        hover = false,
        rename = true,
        signatureHelp = true,
        codeAction = true,
        completion = {
            defaultTagNameCase = "both",
            defaultAttrNameCase = "kebabCase"
        },
        schemaRequestService = true,
        documentHighlight = true,
        codeLens = true,
        semanticTokens = true,
        diagnostics = true
    },
    documentFeatures = {
        selectionRange = true,
        foldingRange = true,
        linkedEditingRange = true,
        documentSymbol = true,
        documentColor = true
    }
}

local custom_init = function(client)
    client.config.flags = client.config.flags or {}
    client.config.flags.allow_incremental_sync = true
end

-- Used for auto install packages
require("nvim-lsp-installer").setup {}

-- Languages

lspconfig.tsserver.setup {capabilities = capabilities}

lspconfig.vimls.setup {
    capabilities = capabilities,
    cmd = {'vim-language-server', '--stdio'}
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
    filatypes = {"c", "cpp", "objc", "objcpp"},
    init_options = {
        compilationDatabaseDirectory = "build",
        index = {threads = 0},
        clang = {excludeArgs = {"-frounding-math"}}
    }
}

-- lspconfig.vuels.setup{}

lspconfig.volar.setup {
    capabilities = capabilities,
    root_dir = util.root_pattern 'package.json',
    init_options = volar_init_options,
    settings = {
        volar = {
            codeLens = {
                references = true,
                pugTools = true,
                scriptSetupTools = true
            },
            vueserver = {fullCompletionList = true}
        }
    },
    on_new_config = function(new_config, new_root_dir)
        if
            new_config.init_options
            and new_config.init_options.typescript
            and new_config.init_options.typescript.tsdk == ''
        then
            new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
        end
    end,
    filetypes = {
        'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue',
        'json', 'html'
    }
}

lspconfig.golangci_lint_ls.setup{}

lspconfig.gopls.setup{}

lspconfig.tailwindcss.setup {}

lspconfig.html.setup {
    capabilities = capabilities,
    filetypes = {
        'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue',
        'json', 'html'
    }
}

-- require'lua_ls'.setup(require'lspconfig', {
--   on_init = custom_init,
--   capabilities = capabilities,
--   cmd = {
--     '/usr/bin/lua-language-server',
--     '-E',
--     '/usr/lib/lua-language-server/main.lua'
--   },
--   diagnosticls = {
--     globals = {'vim'}
--   },
--   telemetry = {
--     enable = false,
--   },
--   -- completion = {
--   --   "keywordSnippet": "Disable",
--   -- },
-- })
