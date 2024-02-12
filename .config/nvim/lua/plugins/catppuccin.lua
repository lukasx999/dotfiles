  return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.g.catppuccin_flavour = "macchiato"
      vim.cmd.colorscheme "catppuccin"

      require("catppuccin").setup({
          --transparent_background = true,
      })
    end
  }
