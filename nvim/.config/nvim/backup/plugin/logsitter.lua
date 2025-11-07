local logsitter = require("logsitter")
local javascript_logger = require("logsitter.lang.javascript")

-- tell logsitter to use the javascript_logger when the filetype is svelte
logsitter.register(javascript_logger, { "svelte", "react" })

vim.keymap.set("n", "<localleader>lg", function()
	logsitter.log()
end)
