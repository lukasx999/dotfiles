return {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()

        vim.keymap.set("n", "<TAB>", require'treesj'.toggle, { desc = "toggle joining/splitting blocks" });

        require'treesj'.setup {
            use_default_keymaps = false,
        }

    end,
}
