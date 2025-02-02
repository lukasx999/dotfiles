return {
    "aserowy/tmux.nvim",
    config = function()

        local tmux = require("tmux")

        vim.keymap.set("n", "<M-h>", function() tmux.move_left    () end, { desc = "navigate to left pane"   })
        vim.keymap.set("n", "<M-j>", function() tmux.move_bottom  () end, { desc = "navigate to bottom pane" })
        vim.keymap.set("n", "<M-k>", function() tmux.move_top     () end, { desc = "navigate to top pane"    })
        vim.keymap.set("n", "<M-l>", function() tmux.move_right   () end, { desc = "navigate to right pane"  })

        vim.keymap.set("n", "<M-H>", function() tmux.resize_left  () end, { desc = "resizing left pane"      })
        vim.keymap.set("n", "<M-J>", function() tmux.resize_bottom() end, { desc = "resizing bottom pane"    })
        vim.keymap.set("n", "<M-K>", function() tmux.resize_top   () end, { desc = "resizing top pane"       })
        vim.keymap.set("n", "<M-L>", function() tmux.resize_right () end, { desc = "resizing right pane"     })

        tmux.setup {
            copy_sync = {
                enable = false,
            },
            navigation = {
                enable_default_keybindings = false,
            },
            resize = {
                enable_default_keybindings = false,
            },
        }

    end
}
