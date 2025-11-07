local function close_other_tabs()
    local current_buf = vim.api.nvim_get_current_buf()
    local buffers = vim.api.nvim_list_bufs()

    for _, buf in ipairs(buffers) do
        if buf ~= current_buf and vim.api.nvim_buf_get_option(buf, 'modified') == false then
            vim.api.nvim_buf_delete(buf, {})
        end
    end
end

vim.api.nvim_create_user_command('CloseOtherTabs', close_other_tabs, {})
