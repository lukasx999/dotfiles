return {
    "catgoose/nvim-colorizer.lua",
    enabled = true,
    event = "BufReadPre",
    opts = {

        user_default_options = {
            names = false,
            css = true,
        },

        filetypes = {
            "*",
            "!oil",
            cmp_docs = { always_update = true },
        },

    },
}
