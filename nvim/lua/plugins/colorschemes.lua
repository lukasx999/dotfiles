local transparent = true

return { 

    {
        "rose-pine/neovim", 
        name = "rose-pine",
        priority = 1000 ,
        config = function()

            require("rose-pine").setup {
                styles = {
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
