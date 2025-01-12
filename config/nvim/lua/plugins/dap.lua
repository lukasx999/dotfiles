return {
    'mfussenegger/nvim-dap',
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap   = require("dap")

        dap.adapters.gdb = {
            type = "executable",
            command = "gdb",
            args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
        }

        dap.configurations.c = {
            {
                name = "Launch",
                type = "gdb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                args = function()
                    return vim.fn.input('Arguments: ', '', 'file')
                end,
                cwd = "${workspaceFolder}",
                stopAtBeginningOfMainSubprogram = true,
            },
        }

        require("nvim-dap-virtual-text").setup {
            all_references    = true,
            clear_on_continue = true,

            -- position virtual text at column 80
            virt_text_win_col = nil, -- nil | 80
        }

        -- GDB mnemonics
        vim.keymap.set("n", "<space>gb", dap.toggle_breakpoint)
        vim.keymap.set("n", "<space>gr", dap.run_to_cursor)
        vim.keymap.set("n", "<space>gc", dap.continue)
        vim.keymap.set("n", "<space>gs", dap.step_into) -- step
        vim.keymap.set("n", "<space>gn", dap.step_over) -- next
        vim.keymap.set("n", "<space>gf", dap.step_out) -- finish
        vim.keymap.set("n", "<space>gB", dap.step_back)
        vim.keymap.set("n", "<space>gR", dap.restart)

        --[[
        local dapui = require("dapui")
        dapui.setup()

        -- Eval var under cursor
        vim.keymap.set("n", "<space>?", function()
            require("dapui").eval(nil, { enter = true })
        end)

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
        ]]




    end,
}
