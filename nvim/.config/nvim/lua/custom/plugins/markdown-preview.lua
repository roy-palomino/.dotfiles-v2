-- Markdown Preview
-- https://github.com/iamcco/markdown-preview.nvim

return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  build = 'cd app && npx --yes yarn install',
  keys = {
    {
      '<leader>mp',
      '<cmd>MarkdownPreviewToggle<cr>',
      desc = '[M]arkdown [P]review toggle',
      ft = 'markdown',
    },
  },
  config = function()
    -- Browser settings
    vim.g.mkdp_browser = '' -- Leave empty to use system default browser

    -- Preview options
    vim.g.mkdp_auto_start = 0 -- Don't auto-start preview when opening markdown files
    vim.g.mkdp_auto_close = 0 -- Don't auto-close preview when switching to other buffer
    vim.g.mkdp_refresh_slow = 0 -- Refresh on save (0) or on change (1)
    vim.g.mkdp_command_for_global = 0 -- Available only for markdown files

    -- Preview server settings
    vim.g.mkdp_open_to_the_world = 0 -- Only accessible on localhost
    vim.g.mkdp_port = '' -- Use random port
    vim.g.mkdp_page_title = '「${name}」' -- Preview page title

    -- Theme and styling
    vim.g.mkdp_theme = 'dark' -- 'dark' or 'light'
    vim.g.mkdp_combine_preview = 0 -- Don't combine preview windows
    vim.g.mkdp_preview_options = {
      mkit = {},
      katex = {},
      uml = {},
      maid = {},
      disable_sync_scroll = 0,
      sync_scroll_type = 'middle',
      hide_yaml_meta = 1,
      sequence_diagrams = {},
      flowchart_diagrams = {},
      content_editable = false,
      disable_filename = 0,
      toc = {},
    }
  end,
}
