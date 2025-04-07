return {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
    config = function()
        require("ibl").setup {
            indent = { char = "▏" },

            scope = {
                show_start = false,
                show_end = false,
            },
        }
    end
}
