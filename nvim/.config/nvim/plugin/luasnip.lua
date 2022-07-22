if vim.g.snippets ~= "luasnip" or not pcall(require, "luasnip") then
  return
end

local ls = require'luasnip'
local types = require'luasnip.util.types'

local s = ls.s
local i = ls.i
local t = ls.t
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

-- snippets
require("luasnip/loaders/from_vscode").lazy_load()

ls.config.set_config {
  history = true,

  updateevents = "TextChanged,TextChangedI",

  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "<-", "Error" } }
      }
    }
  }
}

ls.add_snippets("lua", {
    s("req", fmt("local {} = require('{}')", { i(1, "default"), rep(1) })),
    --TODO: complete this function
    -- s("fn", fmt("local {} = require('{}')", { i(1, "default"), rep(1) })),
    --
    s("html", fmt([[
      s(
        "{}",
        fmt("<{}>{{}}</{}>{{}}", {{i(1, ""), i(0, "")}})
      ),
    ]], {
      i(1, "tag"),
      rep(1),
      rep(1),
   })),
  }
)

ls.add_snippets("typescriptreact", {
    -- s("h1", fmt("<h1>{}<h1>", { i(1, "default"), rep(1) })),
    s(
			"h1",
			fmt("<h1>{}</h1>{}", {i(1, ""), i(0, "")})
		),
    s(
			"h2",
			fmt("<h2>{}</h2>{}", {i(1, ""), i(0, "")})
		),
    s(
			"h3",
			fmt("<h3>{}</h3>{}", {i(1, ""), i(0, "")})
		),
    s(
			"h4",
			fmt("<h4>{}</h4>{}", {i(1, ""), i(0, "")})
		),
    s(
			"h5",
			fmt("<h5>{}</h5>{}", {i(1, ""), i(0, "")})
		),
    s(
			"h6",
			fmt("<h6>{}</h6>{}", {i(1, ""), i(0, "")})
		),
    s(
			"p",
			fmt("<p>{}</p>{}", {i(1, ""), i(0, "")})
		),
    s(
			"body",
			fmt("<body>{}</body>{}", {i(1, ""), i(0, "")})
		),
    s(
			"head",
			fmt("<head>{}</head>{}", {i(1, ""), i(0, "")})
		),
    s(
			"html",
			fmt("<html>{}</html>{}", {i(1, ""), i(0, "")})
		),
    s(
			"title",
			fmt("<title>{}</title>{}", {i(1, ""), i(0, "")})
		),
    s(
			"meta",
			fmt("<meta>{}</meta>{}", {i(1, ""), i(0, "")})
		),
    s(
			"em",
			fmt("<em>{}</em>{}", {i(1, ""), i(0, "")})
		),
    s(
			"b",
			fmt("<b>{}</b>{}", {i(1, ""), i(0, "")})
		),
    s(
			"i",
			fmt("<i>{}</i>{}", {i(1, ""), i(0, "")})
		),
    s(
			"u",
			fmt("<u>{}</u>{}", {i(1, ""), i(0, "")})
		),
    s(
			"a",
			fmt("<a href=\"{}\">{}</a>{}", {i(1, ""), i(2, ""), i(0, "")})
		),
  }
)
