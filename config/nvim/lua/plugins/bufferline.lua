return {
    "akinsho/bufferline.nvim",
    -- "Theyashsawarkar/bufferline.nvim", -- fork vor v0.10
    -- barbar might me better
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    enabled = false,

    event = "VeryLazy",

    config = function()

        require("bufferline").setup({
            options = {
                --numbers = "ordinal",
                diagnostics = "nvim_lsp",

                --[[ diagnostics_indicator = function(count, level)
                        local icon = level:match("error") and " " or ""
                        return " " .. icon .. count
                    end, ]]

                color_icons = true,
                -- separator_style = "slant",

                --separator_style = "padded_slant",
                --separator_style = "padded_slope",
                separator_style = "thin",
                --separator_style = "thick",

                show_buffer_icons = true,
                show_close_icon = false,
                enforce_regular_tabs = false,
                always_show_bufferline = true,
                sort_by = 'insert_after_current',
            },
        })
    end,
}
