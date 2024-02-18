return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
      config.setup({
      ensure_installed = {"lua", "javascript", "c", "vim", "html", "cpp"},
      auto_install = true,
      highlight = { enable = true },
      indend = { enable = true },
    })
  end
}
