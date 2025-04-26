return {
    "catgoose/nvim-colorizer.lua",
    enabled = true,
    event = "BufReadPre",
    opts = {

        filetypes = {
            "*",
            "!oil",
            cmp_docs = { always_update = true },
        },

    },
}
