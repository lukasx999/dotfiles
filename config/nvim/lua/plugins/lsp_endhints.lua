return {
    "chrisgrieser/nvim-lsp-endhints",
    enabled = false,
    event = "LspAttach",
    opts = {}, -- required, even if empty
    config = function()

        require("lsp-endhints").setup {
            icons = {
                type = "󰜁 ",
                parameter = "󰏪 ",
                offspec = " ", -- hint kind not defined in official LSP spec
                unknown = " ", -- hint kind is nil
                -- type = "",
                -- parameter = "",
                -- offspec = "",
                -- unknown = "",
            },
            label = {
                truncateAtChars = 20,
                padding = 1,
                marginLeft = 0,
                sameKindSeparator = ", ",
            },
            extmark = {
                priority = 50,
            },
            autoEnableHints = true,
        }


    end,
}
