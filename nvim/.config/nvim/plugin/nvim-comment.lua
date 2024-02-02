local nvim_comment = require("nvim_comment")
-- require('ts_context_commentstring').setup {
--   enable_autocmd = false,
--   languages = {
--     typescript = '// %s',
--   },
-- }
nvim_comment.setup {
    context_commentstring = {enable = true},
    marker_padding = true,
    comment_empty = false,
    create_mappings = true,
    hook = function()
        if vim.api.nvim_buf_get_option(0, "filetype") == "vue" then
            require("ts_context_commentstring.internal").update_commentstring()
        elseif vim.api.nvim_buf_get_option(0, "filetype") == "typescriptreact" then
            require("ts_context_commentstring.internal").update_commentstring()
        end
    end
}
-- require('nvim-treesitter.configs').setup {}
require('ts_context_commentstring').setup {
    enable_autocmd = false,
    hook = function()
        if vim.api.nvim_buf_get_option(0, "filetype") == "vue" then
            require('ts_context_commentstring').update_commentstring()
        elseif vim.api.nvim_buf_get_option(0, "filetype") == "typescriptreact" then
            require('ts_context_commentstring').update_commentstring()
        end
    end
}
