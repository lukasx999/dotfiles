return {
  "m4xshen/smartcolumn.nvim",
  opts = {},

    config = function()
        require("smartcolumn").setup({

            colorcolumn = "80",
            disabled_filetypes = { "help", "text", "markdown", "oil", "alpha", "checkhealth", "lspinfo", "mason", "noice", "Trouble" },
            custom_colorcolumn = {},
            scope = "file",

        })
    end,

}
