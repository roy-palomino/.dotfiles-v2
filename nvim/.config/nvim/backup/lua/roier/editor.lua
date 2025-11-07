-- Icons setup
local dev_icons = require 'nvim-web-devicons'
-- require("ibl").setup()
local todo = require 'todo-comments'
local treesitter_context = require 'treesitter-context'

treesitter_context.setup {
    enable = true,
    max_lines = 0,
    min_window_height = 0,
    line_numbers = true,
    multiline_threshold = 20,
    trim_scope = 'outer',
    mode = 'cursor',
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
    zindex = 20, -- The Z-index of the context window
    on_attach = nil -- (fun(buf: integer): boolean) return false to disable attaching
}

dev_icons.setup {default = true}

todo.setup {
    keywords = {
        FIX = {
            icon = " ", -- icon used for the sign, and in search results
            color = "error", -- can be a hex color, or a named color (see below)
            alt = {"FIXME", "BUG", "FIXIT", "ISSUE"} -- a set of other keywords that all map to this FIX keywords
            -- signs = false, -- configure signs for some keywords individually
        },
        TODO = {icon = " ", color = "warning"},
        HACK = {icon = " ", color = "warning"},
        WARN = {icon = " ", color = "warning", alt = {"WARNING", "XXX"}},
        PERF = {icon = " ", alt = {"OPTIM", "PERFORMANCE", "OPTIMIZE"}},
        NOTE = {icon = " ", color = "hint", alt = {"INFO"}},
        TEST = {
            icon = "⏲ ",
            color = "test",
            alt = {"TESTING", "PASSED", "FAILED"}
        }
    }
}
