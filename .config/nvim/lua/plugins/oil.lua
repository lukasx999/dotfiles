return {
'stevearc/oil.nvim',
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
  require("oil").setup({
    -- press "-" to enter oil mode, use enter to go inside of dirs
    -- press "-" again to go back
    --vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    vim.keymap.set("n", "§", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  })
  end
}
