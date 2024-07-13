    return {



        {
            "AlessandroYorba/Alduin",
            "AlessandroYorba/Despacio",
            "lunarvim/horizon.nvim",
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
            "loctvl842/monokai-pro.nvim";
        },



        {
            "ku1ik/vim-monokai",
        },


        {
            'Everblush/nvim',
            name = 'everblush',
        },


        {
            'rmehri01/onenord.nvim',
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





        'marko-cerovac/material.nvim',
        "rebelot/kanagawa.nvim",
        'shaunsingh/nord.nvim',
        'ericbn/vim-solarized',
        'morhetz/gruvbox',
        'Mofiqul/dracula.nvim',
        'NTBBloodbath/doom-one.nvim',
        "EdenEast/nightfox.nvim",
        "nyoom-engineering/oxocarbon.nvim",
        'Yagua/nebulous.nvim',

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

        {
            'Mofiqul/vscode.nvim',
        },


    }
