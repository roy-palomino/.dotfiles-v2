-- Custom snippets loader
local ls = require 'luasnip'

-- Load snippets for different filetypes
ls.add_snippets('javascript', require 'custom.snippets.react')
ls.add_snippets('javascriptreact', require 'custom.snippets.react')
ls.add_snippets('typescript', require 'custom.snippets.typescript-react')
ls.add_snippets('typescriptreact', require 'custom.snippets.typescript-react')

