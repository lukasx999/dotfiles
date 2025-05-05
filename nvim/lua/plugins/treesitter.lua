return {

    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
        "nvim-treesitter/nvim-treesitter-context",
    },

    config = function()

        require'treesitter-context'.setup {
            enable       = true,
            multiwindow  = true,
            max_lines    = 1,
            line_numbers = true,
        }

        require'nvim-treesitter.configs'.setup {
            ensure_installed = {
                "c",
                "cpp",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "markdown",
                "markdown_inline",
                "html",
                "json",
            },

            auto_install = true,

            indent = {
                enable = true,
            },

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },


            textobjects = {

                select = {
                    enable    = true,
                    lookahead = true,

                    keymaps = {
                        ["af"] = { query = "@function.outer",    desc = "outer function"    },
                        ["if"] = { query = "@function.inner",    desc = "inner function"    },
                        ["ac"] = { query = "@class.outer",       desc = "outer class"       },
                        ["ic"] = { query = "@class.inner",       desc = "inner class"       },
                        ["ad"] = { query = "@conditional.outer", desc = "outer conditional" },
                        ["id"] = { query = "@conditional.inner", desc = "inner conditional" },
                        ["al"] = { query = "@loop.outer",        desc = "outer loop"        },
                        ["il"] = { query = "@loop.inner",        desc = "inner loop"        },
                    },

                    selection_modes = {
                        ["@function.outer"]    = "V",
                        ["@function.inner"]    = "V",
                        ["@class.outer"]       = "V",
                        ["@class.inner"]       = "V",
                        ["@conditional.outer"] = "V",
                        ["@conditional.inner"] = "V",
                        ["@loop.outer"]        = "V",
                        ["@loop.inner"]        = "V",

                    },

                },
            },





        }


    end
}

