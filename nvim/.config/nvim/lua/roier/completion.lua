local cmp = require'cmp'
local luasnip = require'luasnip'
local lspkind = require'lspkind'

lspkind.init()

local source_mapping = {
  luasnip = "[SNIP]",
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
}

cmp.setup ({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  }),

  sources = cmp.config.sources({
    { name = 'luasnip' },
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    -- { name = 'cmp_tabnine', keyword_length = 5 },
    { name = "buffer", keyword_length = 5 },
  }),

  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      local menu = source_mapping[entry.source.name]
      -- if entry.source.name == 'cmp_tabnine' then
      --   if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
      --     menu = entry.completion_item.data.detail .. ' ' .. menu
      --   end
      --   vim_item.kind = ''
      -- end
      vim_item.menu = menu
      return vim_item
    end,
  },
})
