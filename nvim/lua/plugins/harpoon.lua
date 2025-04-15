return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()

        local harpoon = require("harpoon")
        harpoon:setup()

        vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
        vim.keymap.set("n", "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<M-1>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<M-2>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<M-3>", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<M-4>", function() harpoon:list():select(4) end)
        vim.keymap.set("n", "<M-5>", function() harpoon:list():select(5) end)
        vim.keymap.set("n", "<M-6>", function() harpoon:list():select(6) end)
        vim.keymap.set("n", "<M-7>", function() harpoon:list():select(7) end)
        vim.keymap.set("n", "<M-8>", function() harpoon:list():select(8) end)
        vim.keymap.set("n", "<M-9>", function() harpoon:list():select(9) end)


        -- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
        -- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
        -- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
        -- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<C-n>", function() harpoon:list():next() end)
        vim.keymap.set("n", "<C-p>", function() harpoon:list():prev() end)

        local harpoon_extensions = require("harpoon.extensions")
        harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

    end
}
