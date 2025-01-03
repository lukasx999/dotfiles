return {
    "neovim/nvim-lspconfig",
    config = function()

        local tele = require("telescope.builtin")

        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename,      { desc = "Rename symbol"   })
        vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format,      { desc = "Format buffer"   })
        vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code action"     })

        vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition,  { desc = "Goto definition" })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition,  { desc = "Goto definition" })
        vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration,     { desc = "Goto declaration"     })
        -- vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation,  { desc = "Goto declaration"     })
        vim.keymap.set("n", "<leader>lt", vim.lsp.buf.type_definition,     { desc = "Goto type definition"     })
        vim.keymap.set("n", "<leader>lT", vim.lsp.buf.typehierarchy,     { desc = "Show type hierarchy"     })

        -- Shows symbols in all files of workspac
        vim.keymap.set('n', '<leader>ls', tele.lsp_workspace_symbols, { desc = 'List workspace symbols' })

        -- Show all occurances of current symbol
        vim.keymap.set("n", "<leader>lR", vim.lsp.buf.references, { desc = "References of symbol" })
        -- map('n', '<leader>lR', tele.lsp_references,                     { desc = 'Show References of symbol'     })

        vim.keymap.set("n", "<leader>lm", "K", { desc = "Open manpage" })
        vim.keymap.set("n", "K",          vim.lsp.buf.hover,                       { desc = "Hover"                })
        vim.keymap.set("n", "<leader>lp", "<cmd>Lspsaga peek_definition<CR>",      { desc = "Peek definition"      })
        vim.keymap.set("n", "<leader>lP", "<cmd>Lspsaga peek_type_definition<CR>", { desc = "Peek type definition" })

        -- TODO: parameters to setqflist
        vim.keymap.set("n", "<leader>lq", vim.diagnostic.setqflist, { desc = "Send diagnostics to qflist" })
        -- TODO: have a look add vim.diagnostic

        -- Auto Format on write
        -- vim.api.nvim_create_autocmd("LspAttach", {
        --     callback = function(args)
        --         local client = vim.lsp.get_client_by_id(args.data.client_id)
        --         if not client then return end
        --
        --         if client.supports_method("TextDocument/formatting") then
        --             vim.api.nvim_create_autocmd("BufWritePre", {
        --                 buffer = args.buf,
        --                 callback = function()
        --                     vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
        --                 end
        --             })
        --         end
        --
        --     end,
        -- })

        local icons = {
            hint  = "󰌶 ",
            warn  = "󰀪 ",
            error = "󰅚 ",
            info  = " ",
        }

        -- icons in sign column
        local signs = { Error = icons['error'], Warn = icons['warn'], Hint = icons['hint'], Info = icons['info'] }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end


        local lspconfig = require("lspconfig")

        -- vim.keymap.set("n", "<leader>x", "ClangdSwitchSourceHeader")

        -- LSP setups should go after mason config



        vim.diagnostic.config({
            signs            = true,
            underline        = true,
            update_in_insert = false,
            severity_sort    = false,

            --virtual_text = false,
            virtual_text = {
                -- source = "if_many",
                -- prefix = "󰍉", --   󰍉
                spacing = 5,
                --suffix = "suffix",

                format = function(diagnostic)
                    return diagnostic.message
                end,

                -- Change virtual text icons
                --[[
                    prefix = function(diagnostic)
                        if diagnostic.severity == vim.diagnostic.severity.ERROR then
                            return icons['error']
                        elseif diagnostic.severity == vim.diagnostic.severity.WARN then
                            return icons['warn']
                        elseif diagnostic.severity == vim.diagnostic.severity.INFO then
                            return icons['info']
                        else
                            return icons['hint']
                        end
                    end,
                    --]]

            },
        })






    end,

}
