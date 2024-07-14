    return {


        {
            "ellisonleao/gruvbox.nvim",
            priority = 1000,
            config = function()
                require("gruvbox").setup({
                    terminal_colors = true, -- add neovim terminal colors
                    undercurl = true,
                    underline = true,
                    bold = true,
                    italic = {
                        strings = true,
                        emphasis = true,
                        comments = true,
                        operators = false,
                        folds = true,
                    },
                    strikethrough = true,
                    invert_selection = false,
                    invert_signs = false,
                    invert_tabline = false,
                    invert_intend_guides = false,
                    inverse = true, -- invert background for search, diffs, statuslines and errors
                    contrast = "", -- can be "hard", "soft" or empty string
                    palette_overrides = {},
                    overrides = {},
                    dim_inactive = false,
                    transparent_mode = false,
                })
            end,
        },



        {
            -- 'morhetz/gruvbox',
            'Mofiqul/vscode.nvim',
            "loctvl842/monokai-pro.nvim";
            "ku1ik/vim-monokai",
            'rmehri01/onenord.nvim',
            "AlessandroYorba/Alduin",
            "AlessandroYorba/Despacio",
            "lunarvim/horizon.nvim",
            'marko-cerovac/material.nvim',
            "rebelot/kanagawa.nvim",
            'shaunsingh/nord.nvim',
            'ericbn/vim-solarized',
            'Mofiqul/dracula.nvim',
            'NTBBloodbath/doom-one.nvim',
            "EdenEast/nightfox.nvim",
            "nyoom-engineering/oxocarbon.nvim",
            'Yagua/nebulous.nvim',
        },


        {
            "chriskempson/base16-vim",
            config = function()
            end,
        },


        {
            -- remember color scheme
            'raddari/last-color.nvim',
            config = function()
                -- catppuccin as a backup, `recall()` can return `nil`.

                local theme = require('last-color').recall() or 'catppuccin'
                vim.cmd(('colorscheme %s'):format(theme))

            end,
        },



        {
            'navarasu/onedark.nvim',
            config = function()
                require('onedark').setup {
                    style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
                }
            end,

        },



        {
            'Everblush/nvim',
            name = 'everblush',
        },





        {
            "catppuccin/nvim",
            name = "catppuccin",
            priority = 1000,
            config = function()
                vim.cmd.colorscheme("catppuccin")
                require("catppuccin").setup({
                    flavour = "mocha",
                    --transparent_background = true,
                    term_colors = true,
                    integrations = {
                        indent_blankline = true,
                        telescope = true,
                        mason = true,
                        neotree = true,
                        cmp = true,
                        lsp_saga = true,
                        beacon = true,
                        noice = true,
                        treesitter = true,
                        treesitter_context = true,
                    },
                })
            end,
        },




        {
            "folke/tokyonight.nvim",
            config = function()
                require("tokyonight").setup({
                    style = "night",
                    --transparent = false,
                    terminal_colors = true,
                })

                --vim.cmd.colorscheme("tokyonight")

                --vim.api.nvim_set_hl(0,"BufferLineFill",{bg="none"})
                --vim.api.nvim_set_hl(0,"BufferLineSeperator",{bg="none"})
                --vim.api.nvim_set_hl(0,"BufferLineSeperatorSelected",{bg="none"})
                -- cokeline
                --vim.api.nvim_set_hl(0,"TabLineFill",{bg="none"})

                --vim.api.nvim_set_hl(0,"TelescopeNormal",{bg="none"})
            end,
        },






        {
        "rose-pine/neovim",
        name = "rose-pine",
        },


        {
            'projekt0n/github-nvim-theme',
            lazy = false, -- make sure we load this during startup if it is your main colorscheme
            priority = 1000, -- make sure to load this before all the other start plugins
            config = function()
                require('github-theme').setup({
                    -- ...
                })

                --vim.cmd('colorscheme github_dark')
            end,
        },



    }
