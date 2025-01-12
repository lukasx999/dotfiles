return {
    "neovim/nvim-lspconfig",
    config = function()
        local tele = require("telescope.builtin")
        -- NOTE: possibly using telescope instead of qflist

        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename,           { desc = "Rename symbol"     })
        vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format,           { desc = "Format buffer"     })
        vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action,      { desc = "Code action"       })
        vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition,       { desc = "Definition"        })
        vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration,      { desc = "Declaration"       })
        vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation,   { desc = "implementation"    })
        vim.keymap.set("n", "<leader>lc", vim.lsp.buf.incoming_calls,   { desc = "Call Sites"        })
        vim.keymap.set("n", "<leader>lC", vim.lsp.buf.outgoing_calls,   { desc = "Outgoing Calls"    })
        vim.keymap.set("n", "<leader>lt", vim.lsp.buf.type_definition,  { desc = "Type Definition"   })
        vim.keymap.set("n", "<leader>lT", vim.lsp.buf.typehierarchy,    { desc = "Type Hierarchy"    })
        vim.keymap.set('n', '<leader>ls', vim.lsp.buf.workspace_symbol, { desc = "Workspace Symbols" })
        vim.keymap.set("n", "<leader>lR", vim.lsp.buf.references,       { desc = "References"        })
        vim.keymap.set("n", "<leader>lm", "K",                          { desc = "Manpage"           })
        vim.keymap.set("n", "K",          vim.lsp.buf.hover,            { desc = "Hover"             })

        vim.keymap.set("n", "<leader>lh",
            function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
            { desc = "Toggle Inlay Hints" })

        vim.keymap.set("n", "<leader>lq",
            function() vim.diagnostic.setqflist({ open = true }) end,
            { desc = "Diagnostics to qflist" })




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

        vim.lsp.inlay_hint.enable(true)

        vim.diagnostic.config({
            signs            = true,
            underline        = true,
            update_in_insert = false,
            severity_sort    = false,

            virtual_text = {
                spacing = 5,

                format = function(diagnostic)
                    return diagnostic.message
                end,

                -- Icons
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

            },
        })






    end,

}
