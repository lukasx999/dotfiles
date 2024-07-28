return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                theme = "auto",
                -- theme = "horizon",

                -- theme = "gruvbox",
                -- theme = "gruvbox_dark",
                -- theme = "gruvbox-material",
                -- theme = "base16",
                -- theme = "ayu_dark",
                -- theme = "solarized_dark",
                --theme = 'tokyonight',
                -- component_separators = { left = "", right = "" },
                -- section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { "filename", "filesize" },
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { "searchcount", "selectioncount", "progress" },
                lualine_z = { "location" },
            },
        })
    end,
}
