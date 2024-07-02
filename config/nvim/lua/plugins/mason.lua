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
                        "lua_ls",
                        "bashls",
                        "clangd",
                        "jsonls",
                        -- "ltex",
                        -- "marksman",
                        --"pylsp",
                        "jedi_language_server",
                        "cssls",
                        "ast_grep",
                        "arduino_language_server",
                        "cmake",
                        "html",
                        "yamlls",
                        -- "nil_ls",
                        -- "rnix",
                        -- "tsserver",
                        -- "asm_lsp",
                        -- "cpplint",
                        -- "cpptools",
                        -- "harper-ls",
                        -- "rubocop",
                        -- "rust_analyzer",
                        -- "sqlls",
                        -- "matlab_ls",
                        -- "autotools_ls",
                        -- "jinja_lsp",
                        -- "hdl_checker",
                        -- "gopls",
                        -- "awk_ls",
                    },
                })
                require("mason-lspconfig").setup_handlers({
                    function(server_name)
                        require("lspconfig")[server_name].setup({})
                    end,
                })
            end,
        },





    }
