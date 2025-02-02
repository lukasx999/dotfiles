return {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {

        filetypes = {
            "*",
            "!oil",
            cmp_docs = { always_update = true },
        },

    },
}
