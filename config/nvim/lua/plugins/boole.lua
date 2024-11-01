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
                { "x",         "y"       },
                { "up",        "down"    },
                { "width",     "height"  },
                { "left",      "right"   },
                { "top",       "bottom"  },
                { "above",     "below"   },
                { "start",     "end"     },
                { "beginning", "end"     },
                { "plus",      "minus"   },
                { "north",     "south"   },
                { "west",      "east"    },
                { "enable",    "disable" },
                { "on",        "off"     },
                { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten" },

                --{ "enable", "disable" },
                -- enable → disable
                -- Enable → Disable
                -- ENABLE → DISABLE
            },
        })
    end,
}
