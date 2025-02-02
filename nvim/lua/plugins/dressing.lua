return {
    'stevearc/dressing.nvim',
    opts = {

        input = {
            border = "single", -- These are passed to nvim_open_win
        },

        select = {
            enabled = true,
            backend = { "telescope", "builtin"},

            telescope = require("telescope.config").values,

            builtin = {
                show_numbers = true,
                border = "single", -- These are passed to nvim_open_win
            },
        },

    },
}
