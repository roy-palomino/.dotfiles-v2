local neogit = require('neogit')

neogit.setup {
  -- customize displayed signs
  signs = {
    -- { CLOSED, OPENED }
    section = { "▶", "▼" },
    item = { "▶", "▼" },
    hunk = { "", "" },
  },

  commit_popup = {
    kind = "split_above",
  }
}
