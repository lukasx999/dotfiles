local transparent = true

return {

    {
        "rebelot/kanagawa.nvim",
        config = function()

            require('kanagawa').setup {
                transparent = transparent,
            }

        end
    },

    {
        "EdenEast/nightfox.nvim",
        config = function()
            require("nightfox").setup {
                options = {
                    transparent = transparent,
                }
            }
        end
    },

    {
        "Tsuzat/NeoSolarized.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("NeoSolarized").setup {
                transparent = transparent,
                enable_italics = false,
            }
        end
    },

    {
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1000,
        config = function()
            require("everforest").setup {
                transparent_background_level = transparent and 1 or 0,
                background = "hard", -- soft, medium, hard
            }
        end,

    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000 ,
        config = function()

            require("rose-pine").setup {
                styles = {
                    bold = false,
                    italic = false,
                    transparency = transparent,
                },

            }

        end
    },

    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000 ,
        config = true,
        opts = {
            bold = false,
            transparent_mode = transparent,
        }
    },


}
