vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- new conf
local lspkind = require "lspkind"
lspkind.init()

-- Completation configuration
local cmp = require'cmp'
local luasnip = require'luasnip'

cmp.setup{
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    })
  },
  sources = {
    { name = 'nvim_lua' },

    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'luasnip' },
    { name = "buffer", keyword_length = 5},
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        luasnip = "[snip]",
      },
    },
  },
}

local Group = require("colorbuddy").setup()
local g = require("colorbuddy.group").groups
local s = require("colorbuddy.style").styles

Group.new("CmpItemAbbr", g.Comment)
Group.new("CmpItemAbbrDeprecated", g.Error)
Group.new("CmpItemAbbrMatchFuzzy", "#ffffff", nil, s.italic)
Group.new("CmpItemKind", g.Special)
Group.new("CmpItemMenu", g.NonText)
