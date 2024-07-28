return {
    "nat-418/boole.nvim",
    config = function()
        require("boole").setup({
            mappings = {
                increment = "<C-a>",
                decrement = "<C-x>",
            },
            -- User defined loops
            additions = {

            },
            allow_caps_additions = {
                { "foo", "bar", "baz", "qux", "quux" },
                { "tic", "tac", "toe" },
                { "up", "down" },
                { "x", "y" },
                { "width", "height" },
                { "left", "right" },
                { "top", "bottom" },
                { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten" },

                --{ "enable", "disable" },
                -- enable → disable
                -- Enable → Disable
                -- ENABLE → DISABLE
            },
        })
    end,
}
