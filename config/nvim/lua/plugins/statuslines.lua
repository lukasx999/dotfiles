    return {



        {
            "nvim-lualine/lualine.nvim",
            dependencies = { "nvim-tree/nvim-web-devicons" },
            config = function()
                require("lualine").setup({
                    options = {
                        theme = "auto",
                        --theme = 'tokyonight',
                        component_separators = { left = "", right = "" },
                        section_separators = { left = "", right = "" },
                    },
                    sections = {
                        lualine_a = { "mode" },
                        lualine_b = { "branch", "diff", "diagnostics" },
                        lualine_c = { "filename", "filesize" },
                        lualine_x = { "encoding", "fileformat", "filetype" },
                        lualine_y = { "progress" },
                        lualine_z = { "location" },
                    },
                })
            end,
        },






        -- {
        --     "utilyre/barbecue.nvim",
        --     name = "barbecue",
        --     version = "*",
        --     dependencies = {
        --         "SmiteshP/nvim-navic",
        --         "nvim-tree/nvim-web-devicons", -- optional dependency
        --     },
        --     opts = {},
        --
        --     config = function()
        --         vim.keymap.set("n", "<leader>te", "<cmd>Barbecue toggle<CR>", { desc = "Winbar", silent = true })
        --         require("barbecue").setup({
        --             -- better performance
        --             create_autocmd = false,
        --
        --             vim.api.nvim_create_autocmd({
        --                 "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
        --                 "BufWinEnter",
        --                 "CursorHold",
        --                 "InsertLeave",
        --
        --                 -- include this if you have set `show_modified` to `true`
        --                 "BufModifiedSet",
        --             }, {
        --                     group = vim.api.nvim_create_augroup("barbecue.updater", {}),
        --                     callback = function()
        --                         require("barbecue.ui").update()
        --                     end,
        --                 }),
        --
        --
        --             -- -- scrolling bug fix for neovide
        --             -- lead_custom_section = function()
        --             --     return { { " ", "WinBar" } }
        --             -- end,
        --
        --
        --
        --
        --         })
        --     end,
        -- },





        {
            "akinsho/bufferline.nvim",
            -- "Theyashsawarkar/bufferline.nvim", -- fork vor v0.10
            -- barbar might me better
            version = "*",
            dependencies = "nvim-tree/nvim-web-devicons",

            event = "VeryLazy",
            --event = "LazyLoad",

            --after = "catppuccin",

            config = function()

                vim.opt.termguicolors = true


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
                        show_close_icon = true,
                        enforce_regular_tabs = false,
                        always_show_bufferline = true,
                        sort_by = 'insert_after_current',
                    },
                })
            end,
        },



    }
