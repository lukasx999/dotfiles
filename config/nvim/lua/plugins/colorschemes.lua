local transparent = true

return {

    {
        "bakageddy/alduin.nvim",
        config = function()
            require("alduin").setup({
                terminal_colors = true,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                palette_overrides = {},
                overrides = {},
            })
        end,
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup {
                variant = "auto", -- auto, main, moon, or dawn
                dark_variant = "main", -- main, moon, or dawn
                dim_inactive_windows = false,
                extend_background_behind_borders = true,

                styles = {
                    bold = true,
                    italic = true,
                    transparency = transparent,
                },


            }
        end,
    },

    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                terminal_colors = true, -- add neovim terminal colors
                undercurl = true,
                underline = true,
                bold = false,
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
                transparent_mode = transparent,
            })
        end,
    },


    {
        "blazkowolf/gruber-darker.nvim",
        config = function()
            require("gruber-darker").setup({
                bold = false,
            })
        end,
    },

    {
        "wtfox/jellybeans.nvim",
        config = function()
        end,
    },


    {
        "masar3141/mono-jade",
        config = function()
        end,
    },

    {
        "loctvl842/monokai-pro.nvim";
        "AlessandroYorba/Despacio",
        "lunarvim/horizon.nvim",
        'marko-cerovac/material.nvim',
        "rebelot/kanagawa.nvim",
        'ericbn/vim-solarized',
        'NTBBloodbath/doom-one.nvim',
        "EdenEast/nightfox.nvim",
        "nyoom-engineering/oxocarbon.nvim",
    },


    -- TODO: base16-nvim
    {
        "chriskempson/base16-vim",
        config = function()
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

    -- remember color scheme
    {
        'raddari/last-color.nvim',
        config = function()
            local theme = require('last-color').recall() or 'gruvbox'
            vim.cmd.colorscheme(theme)
        end,
    },

}
