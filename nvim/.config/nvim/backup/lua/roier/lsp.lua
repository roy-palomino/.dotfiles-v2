local util = require 'lspconfig.util'
local cmp_nvim = require 'cmp_nvim_lsp'
local lspconfig = require('lspconfig')

local capabilities = cmp_nvim.default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

-- local vue_language_server_path = '/Users/roy_1/.npm-global/bin/vue-language-server'
local typescript_plugin_path = '/Users/roy_1/.npm-global/lib/node_modules/@vue/typescript-plugin'

local css_capabilities = vim.lsp.protocol.make_client_capabilities()

local function get_typescript_server_path(root_dir)
  local global_ts = '/usr/local/lib/node_modules/typescript/lib'
  local found_ts = ''
  local function check_dir(path)
    found_ts =  util.path.join(path, 'node_modules', 'typescript', 'lib')
    if util.path.exists(found_ts) then
      return path
    end
  end
  if util.search_ancestors(root_dir, check_dir) then
    return found_ts
  else
    return global_ts
  end
end

local vim_capabilities = vim.lsp.protocol.make_client_capabilities()
vim_capabilities.textDocument.synchronization.didSave = true
vim_capabilities.textDocument.synchronization.dynamicRegistration = true
vim_capabilities.textDocument.synchronization.willSave = true
vim_capabilities.textDocument.synchronization.willSaveWaitUntil = true

css_capabilities.textDocument.completion.completionItem.snippetSupport = true

capabilities.textDocument.completion.completionItem.snippetSupport = true

require("mason").setup()
require("mason-lspconfig").setup()

-- https://github.com/johnsoncodehk/volar/blob/20d713b/packages/shared/src/types.ts
local volar_init_options = {
    typescript = {
        tsdk = '/usr/local/lib/node_modules/typescript/lib',
    },
    languageFeatures = {
        references = true,
        definition = true,
        typeDefinition = true,
        callHierarchy = true,
        hover = true,
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
    },
    vueCompilerOptions = {
        experimentalCompatMode = 2,
        experimentalTemplateCompilerOptions = {
            compatConfig = {
                MODE = 2,
            }
        }
    }

}

-- Used for auto install packages
require("nvim-lsp-installer").setup {}

-- Languages

lspconfig.tsserver.setup {
    init_options = {
        plugins = {
            {
                name = '@vue/typescript-plugin',
                location = typescript_plugin_path,
                languages = { 'vue' },
            },
        },
    },
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    capabilities = capabilities
}

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

lspconfig.volar.setup {
    -- cmd = { 'vue-language-server', '--stdio' },
    -- capabilities = vim_capabilities,
    -- root_dir = util.root_pattern 'package.json',
    -- init_options = volar_init_options,
    -- settings = {
    --     volar = {
    --         codeLens = {
    --             references = true,
    --             pugTools = true,
    --             scriptSetupTools = true
    --         },
    --         vueserver = {fullCompletionList = true}
    --     }
    -- },
    -- on_new_config = function(new_config, new_root_dir)
    --     new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
    -- end,
    -- filetypes = {
    --     'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue',
    --     'json', 'html'
    -- },
    -- docs = {
    --     description = [[
    --         https://github.com/johnsoncodehk/volar/tree/20d713b/packages/vue-language-server
    --     ]]
    -- }
}

local function get_python_path(workspace)
    if vim.fn.glob(workspace .. '/venv/bin/python') ~= '' then
        return workspace .. '/venv/bin/python'
    elseif vim.fn.glob(workspace .. '/.venv/bin/python') ~= '' then
        return workspace .. '/.venv/bin/python'
    else
        return '/opt/homebrew/bin/python3'  -- O la ruta de tu intérprete de Python del sistema
    end
end

vim.g.python3_host_prog = '/opt/homebrew/bin/python3'

-- lspconfig.jedi_language_server.setup{}
lspconfig.pylsp.setup{
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = { enabled = false },
            },
        },
    },
  cmd = { get_python_path(vim.fn.getcwd()), '-m', 'pylsp' },
}
-- lspconfig.flake8.setup{}

-- lspconfig.golangci_lint_ls.setup{}

lspconfig.gopls.setup{}

lspconfig.tailwindcss.setup {}

lspconfig.astro.setup{}

lspconfig.dockerls.setup{}

lspconfig.docker_compose_language_service.setup{}

lspconfig.emmet_language_server.setup{}

lspconfig.html.setup {
    capabilities = capabilities,
    filetypes = {
        'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue',
        'json', 'html'
    }
}

lspconfig.cssls.setup{
    capabilities = capabilities,
}

lspconfig.cssmodules_ls.setup{}

lspconfig.css_variables.setup{}

lspconfig.graphql.setup{
    cmd = { "graphql-lsp", "server", "-m", "stream" },
    filetypes = {
        "graphql",
        "typescriptreact",
        "javascriptreact",
        "javascript",
        "typescript"
    },
  root_dir = require('lspconfig.util').root_pattern(".git", ".graphqlrc"),
}

lspconfig.lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
      }
    })
  end,
  settings = {
    Lua = {
        diagnostics = {
            globals = {"vim"}
        }
    }
  }
}
