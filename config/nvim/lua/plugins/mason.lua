return {

    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim" },
        config = function()

            require("mason-lspconfig").setup({
                ensure_installed = {
                    --[[ This will just break the setup on other machines ]]
                },
            })

            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    require("lspconfig")[server_name].setup({})

                    -- local capabilities = require('blink.cmp').get_lsp_capabilities()
                    -- require('lspconfig')[server_name].setup({ capabilities = capabilities })

                end,
            })


            local lspconfig = require("lspconfig")

            lspconfig.rust_analyzer.setup({
                settings = {
                    ['rust-analyzer'] = {

                        cargo = {
                            -- list targets with `rustc --print target-list`
                            -- target = "aarch64-unknown-linux-gnu"
                        },

                        diagnostics = {
                            enable = true
                        },

                    }
                }
            })

            lspconfig.clangd.setup({
                cmd = {
                    "clangd",
                    "--background-index",
                    "--suggest-missing-includes",
                    "--clang-tidy",
                    "--log=verbose",
                    "--header-insertion=iwyu"
                },

                init_options = {
                    fallbackFlags = {
                        "-Wall",
                        "-Wextra",
                    },
                },

                filetypes = { "c", "h", "cpp", "hpp" },

            })

        end,
    },

}
