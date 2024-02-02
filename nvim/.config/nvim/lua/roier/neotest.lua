require("neodev").setup({})

require("neotest").setup({
    adapters = {
        require("neotest-jest")({
            jestCommand = "yarn test --watch",
        })
    },
    -- output = {enabled = true, open_on_run = true},
    -- output_panel = {
    --   enabled = true,
    --   open = "right split | resize 15"
    -- },
})
