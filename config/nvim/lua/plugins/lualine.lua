return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                theme = "auto",
                -- component_separators = { left = "", right = "" },
                -- section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
                section_separators   = { left = "", right = "" },
                fmt = string.lower,
                globalstatus = true,

            },


            -- winbar = {
            --     lualine_a = {},
            --     lualine_b = {},
            --     lualine_c = {'filename'},
            --     lualine_x = {},
            --     lualine_y = {},
            --     lualine_z = {}
            -- },

            -- inactive_winbar = {
            --     lualine_a = {},
            --     lualine_b = {},
            --     lualine_c = {'filename'},
            --     lualine_x = {},
            --     lualine_y = {},
            --     lualine_z = {}
            -- };

            extensions = {
                'quickfix',
                'oil',
                'lazy',
                'man',
                'mason',
                'symbols-outline',
            },


            sections = {

                lualine_a = {
                    {
                        "mode",
                        icons_enabled = true,
                        fmt = function(str)
                            return str:sub(1, 3):lower()
                        end,
                        icon = "",
                    },
                },

                -- lualine_b = {},
                lualine_b = { "branch", "diff", "diagnostics" },

                lualine_c = {

                    {
                        "filename",
                        file_status = true,
                    },

                    "filesize" },


                lualine_x = {
                    {
                        "filetype",
                        colored   = true,
                        icon_only = false,
                        icon = { align = 'right' },
                    },

                },

                lualine_y = { "searchcount", "selectioncount", "progress" },
                lualine_z = { "location" },

                -- lualine_b = { "branch", "diff", "diagnostics" },
                -- lualine_x = { "encoding", "fileformat", "filetype" },
                -- lualine_y = { "searchcount", "selectioncount", "progress" },
                -- lualine_z = { "location" },

            },
        })
    end,
}
