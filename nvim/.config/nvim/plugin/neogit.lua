local neogit = require('neogit')

neogit.setup {
  disable_commit_confirmation = true,
  -- customize displayed signs
  signs = {
    -- { CLOSED, OPENED }
    section = { "▶", "▼" },
    item = { "▶", "▼" },
    hunk = { "+", "-" },
  },

  commit_popup = {
    kind = "split_above",
  }
}
