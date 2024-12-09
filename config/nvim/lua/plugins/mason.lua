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
                    end,
                })

                local lspconfig = require("lspconfig")

                lspconfig.rust_analyzer.setup({
                    settings = {
                        ['rust-analyzer'] = {

                            -- cargo = {
                            --     -- target = "aarch64-linux-gnu"
                            --     target = "aarch64"
                            -- },

                            diagnostics = {
                                enable = true;
                            }
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
                            '-std=c99',
                            "-pedantic",
                            "-Wall",
                            "-Wextra"
                        },
                    },

                    -- on_init = custom_init,
                    -- on_attach = function() end,
                    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },

                })



            end,
        },





    }
