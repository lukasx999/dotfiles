return {
    enabled = false,
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {},
    config = function()

        local wk = require("which-key")


        wk.setup({

            icons = {
                rules = false  -- Disable icons
            },
            preset = "helix",  -- helix, classic, modern
            mode = "n", -- NORMAL mode
            -- prefix: use "<leader>f" for example for mapping everything related to finding files
            -- the prefix is prepended to every mapping part of `mappings`
            prefix = "",
            buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
            silent = true, -- use `silent` when creating keymaps
            noremap = true, -- use `noremap` when creating keymaps
            nowait = false, -- use `nowait` when creating keymaps
            expr = false, -- use `expr` when creating keymaps



            win = {
                no_overlap = true,  -- don't allow the popup to overlap with the cursor
                -- width = 1,
                -- height = { min = 4, max = 25 },
                -- col = 0,
                -- row = math.huge,
                -- border = "none",
                padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
                title = true,
                title_pos = "center",
                zindex = 1000,

                -- value between 0-100 0 for fully opaque and 100 for fully transparent
                wo = { winblend = 10 },
            },






        })


        -- Keybind Groups
        wk.add({
            { "<leader>f", group = "File" },
            { "<leader>t", group = "Toggle" },
            { "<leader>l", group = "LSP" },
            { "<leader>m", group = "Move in context" },
            { "<leader>w", group = "Windows" },
            { "<leader>b", group = "Buffers" },
            { "ZA", group = "All" }
        })



    end,
}

