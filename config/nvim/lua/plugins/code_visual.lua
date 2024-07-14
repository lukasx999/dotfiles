    return {


        {
            "NvChad/nvim-colorizer.lua",
            config = function()
                require("colorizer").setup({
                    filetypes = {
                        "*",
                        "!oil",  -- Dont show colors in oil
                        "!neo-tree",
                        cmp_docs = { always_update = true },
                    },
                })
                vim.keymap.set("n", "<leader>to", "<cmd>ColorizerToggle<CR>", { desc = "Colorizer" })
            end,
        },



        {
            "HiPhish/rainbow-delimiters.nvim",
            config = function() end,
        },


        {
            "lukas-reineke/indent-blankline.nvim",
            main = "ibl",
            opts = {},
            config = function()
                vim.keymap.set("n", "<leader>ti", "<cmd>IBLToggle<CR>", { desc = "Indent-Blankline" })

                require("ibl").setup()

                -- for support with rainbow delimiters
                local highlight = {
                    "RainbowRed",
                    "RainbowYellow",
                    "RainbowBlue",
                    "RainbowOrange",
                    "RainbowGreen",
                    "RainbowViolet",
                    "RainbowCyan",
                }
                local hooks = require("ibl.hooks")
                -- create the highlight groups in the highlight setup hook, so they are reset
                -- every time the colorscheme changes
                hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                    vim.api.nvim_set_hl(0, "RainbowRed",    { fg = "#E06C75" })
                    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
                    vim.api.nvim_set_hl(0, "RainbowBlue",   { fg = "#61AFEF" })
                    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
                    vim.api.nvim_set_hl(0, "RainbowGreen",  { fg = "#98C379" })
                    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
                    vim.api.nvim_set_hl(0, "RainbowCyan",   { fg = "#56B6C2" })
                end)

                vim.g.rainbow_delimiters = { highlight = highlight }
                require("ibl").setup({ scope = { highlight = highlight } })

                hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
            end,
        },



    }
