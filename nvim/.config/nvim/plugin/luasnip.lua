if vim.g.snippets ~= "luasnip" or not pcall(require, "luasnip") then return end

local ls = require 'luasnip'
local types = require 'luasnip.util.types'

local s = ls.s
local i = ls.i
local c = ls.c
local d = ls.d
local t = ls.t
local f = ls.f
local sn = ls.sn
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

-- snippets
require("luasnip/loaders/from_vscode").lazy_load()

ls.config.set_config {
    history = true,

    updateevents = "TextChanged,TextChangedI",

    ext_opts = {[types.choiceNode] = {active = {virt_text = {{"<-", "Error"}}}}}
}

ls.add_snippets("lua", {
    s("req", fmt("local {} = require('{}')", {i(1, "default"), rep(1)})),
    -- TODO: complete this function
    -- s("fn", fmt("local {} = require('{}')", { i(1, "default"), rep(1) })),
    --
    s("html", fmt([[
      s(
        "{}",
        fmt("<{}>{{}}</{}>{{}}", {{i(1, ""), i(0, "")}})
      ),
    ]], {i(1, "tag"), rep(1), rep(1)}))
})

ls.add_snippets("typescript", {
    s("import",
      fmt("import {{ {} }} from \"{}\";{}", {i(2, ""), i(1, ""), i(0, "")}))
})

ls.add_snippets("typescriptreact", {
    s("import",
      fmt("import {{ {} }} from \"{}\";{}", {i(2, ""), i(1, ""), i(0, "")})),
    -- const Home = lazy(() => import("../pages/home"));
    s("lazy", fmt("const {} = lazy(() => import(\"{}\"));{}",
                  {i(2, ""), i(1, ""), i(0, "")})),
    s({trig = "<([%w_]+)", regTrig = true, hidden = true}, fmt([[
     <{}{}
   ]], {
        c(1, {
            f(function(_, exp) return exp.captures[1] .. " />" end),
            f(function(_, exp)
                local tag = exp.captures[1]
                return tag .. "></" .. tag .. ">"
            end)
        }), i(0, "")
    })), s({trig = "([%w_]+).([%w_]+)", regTrig = true, hidden = true}, fmt([[
     <{}{}
   ]], {
        c(1, {
            f(function(_, exp)
                local tag = exp.captures[1]
                local class = exp.captures[2]
                return tag .. " class=\"" .. class .. "\"></" .. tag .. ">"
            end), f(function(_, exp)
                local tag = exp.captures[1]
                local class = exp.captures[2]
                return tag .. " class=\"" .. class .. "\" />"
            end)
        }), i(0, "")
    })), s("h1", fmt("<h1>{}</h1>{}", {i(1, ""), i(0, "")})),
    s("h2", fmt("<h2>{}</h2>{}", {i(1, ""), i(0, "")})),
    s("h3", fmt("<h3>{}</h3>{}", {i(1, ""), i(0, "")})),
    s("h4", fmt("<h4>{}</h4>{}", {i(1, ""), i(0, "")})),
    s("h5", fmt("<h5>{}</h5>{}", {i(1, ""), i(0, "")})),
    s("h6", fmt("<h6>{}</h6>{}", {i(1, ""), i(0, "")})),
    s("p", fmt("<p>{}</p>{}", {i(1, ""), i(0, "")})),
    s("body", fmt("<body>{}</body>{}", {i(1, ""), i(0, "")})),
    s("head", fmt("<head>{}</head>{}", {i(1, ""), i(0, "")})),
    s("html", fmt("<html>{}</html>{}", {i(1, ""), i(0, "")})),
    s("title", fmt("<title>{}</title>{}", {i(1, ""), i(0, "")})),
    s("meta", fmt("<meta>{}</meta>{}", {i(1, ""), i(0, "")})),
    s("em", fmt("<em>{}</em>{}", {i(1, ""), i(0, "")})),
    s("b", fmt("<b>{}</b>{}", {i(1, ""), i(0, "")})),
    s("i", fmt("<i>{}</i>{}", {i(1, ""), i(0, "")})),
    s("u", fmt("<u>{}</u>{}", {i(1, ""), i(0, "")})),
    s("a", fmt("<a href=\"{}\">{}</a>{}", {i(1, ""), i(2, ""), i(0, "")})),
    s("br", fmt("<br>{}</br>{}", {i(1, ""), i(0, "")})),
    s("hr", fmt("<hr>{}</hr>{}", {i(1, ""), i(0, "")})),
    s("ul", fmt("<ul>{}</ul>{}", {i(1, ""), i(0, "")})),
    s("li", fmt("<li>{}</li>{}", {i(1, ""), i(0, "")})),
    s("ol", fmt("<ol>{}</ol>{}", {i(1, ""), i(0, "")})),
    s("img", fmt("<img src=\"{}\">{}</img>{}", {i(1, ""), i(2, ""), i(0, "")})),
    s("link", fmt("<link rel=\"{}\" type=\"{}\" href=\"{}\">{}</link>{}", {
        i(1, "stylesheet"), i(2, "text/css"), i(3, "style.css"), i(4, ""),
        i(0, "")
    })), s("table", fmt("<table>{}</table>{}", {i(1, ""), i(0, "")})),
    s("tbody", fmt("<tbody>{}</tbody>{}", {i(1, ""), i(0, "")})),
    s("tr", fmt("<tr>{}</tr>{}", {i(1, ""), i(0, "")})),
    s("td", fmt("<td>{}</td>{}", {i(1, ""), i(0, "")})),
    s("thead", fmt("<thead>{}</thead>{}", {i(1, ""), i(0, "")})),
    s("th", fmt("<th>{}</th>{}", {i(1, ""), i(0, "")})),
    s("form", fmt("<form>{}</form>{}", {i(1, ""), i(0, "")})),
    s("input", fmt("<input>{}</input>{}", {i(1, ""), i(0, "")})),
    s("textarea", fmt("<textarea>{}</textarea>{}", {i(1, ""), i(0, "")})),
    s("center", fmt("<center>{}</center>{}", {i(1, ""), i(0, "")})),
    s("option", fmt("<option>{}</option>{}", {i(1, ""), i(0, "")})),
    s("button", fmt("<button>{}</button>{}", {i(1, ""), i(0, "")})),
    s("div", fmt("<div>{}</div>{}", {i(1, ""), i(0, "")})),
    s("header", fmt("<header>{}</header>{}", {i(1, ""), i(0, "")})),
    s("nav", fmt("<nav>{}</nav>{}", {i(1, ""), i(0, "")})),
    s("script", fmt("<script src=\"{}\" type=\"{}\">{}</script>{}", {
        i(1, "/file.js"), i(2, "text/javascript"), i(3, ""), i(0, "")
    }))
})
