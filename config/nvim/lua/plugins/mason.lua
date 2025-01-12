
local function configure_tsls()
    local inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
    },

    require("lspconfig").ts_ls.setup {
        settings = {
            typescript = {
                inlayHints = inlayHints,
            },
            javascript = {
                inlayHints = inlayHints,
            },
        },
    }
end

local function configure_clangd()
    require("lspconfig").clangd.setup({
        filetypes = { "c", "h", "cpp", "hpp" },
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
                "-std=c99",
                "-pedantic",
            },
        },
        settings = {
            clangd = {
                CompileFlags = {
                    Add      = { "-Wall", "-Wextra" },
                    Remove   = { "-W*" } ,
                    Compiler = "clang",
                },
                InlayHints = {
                    Enabled        = true,
                    Designators    = true,
                    ParameterNames = true,
                    DeducedTypes   = true,
                    BlockEnd       = true,
                },
            },
        },
    })
end


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
                    "clangd",
                    "rust_analyzer",
                    "gopls",
                    "ts_ls",
                    "jedi_language_server",
                    -- "ast_grep",
                    "ocamllsp",
                    "glsl_analyzer",
                    "asm_lsp",
                    "bashls",
                },
            })

            require("mason-lspconfig").setup_handlers({
                function(server_name)
                    if server_name == 'rust_analyzer' or server_name == "clangd" then return end -- Rustaceanvim
                    require("lspconfig")[server_name].setup({})
                end,
            })


            local lspconfig = require("lspconfig")

            -- lspconfig.rust_analyzer.setup({
            --     settings = {
            --         ['rust-analyzer'] = {
            --
            --             cargo = {
            --                 -- list targets with `rustc --print target-list`
            --                 -- target = "aarch64-unknown-linux-gnu"
            --             },
            --
            --             diagnostics = {
            --                 enable = true
            --             },
            --
            --         }
            --     }
            -- })

            configure_clangd()
            configure_tsls()


            -- lua-ls
            lspconfig.lua_ls.setup {
                settings = {
                    Lua = {
                        hint = { enable = true },
                    },
                },
            }

            lspconfig.glslls.setup {
                -- filetypes = { "glsl", "vert", "frag" },
            }

            -- gopls
            lspconfig.gopls.setup {
                settings = {
                    hints = {
                        rangeVariableTypes = true,
                        parameterNames = true,
                        constantValues = true,
                        assignVariableTypes = true,
                        compositeLiteralFields = true,
                        compositeLiteralTypes = true,
                        functionTypeParameters = true,
                    },
                },
            }




        end,
    },

}
