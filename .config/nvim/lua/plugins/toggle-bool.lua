return {
  "gerazov/toggle-bool.nvim",

  config = function()
require("toggle-bool").setup {
  mapping = "<leader>b",
  additional_toggles = {
    Yes = 'No',
    On = 'Off',
    ["0"] = "1",
    Enable = 'Disable',
    Enabled = 'Disabled',
    First = 'Last',
    Before = 'After',
    Persistent = 'Ephemeral',
    Internal = 'External',
    Ingress = 'Egress',
    Allow = 'Deny',
    All = 'None',
  },

-- :lua require("toggle-bool").toggle_bool()

}

  end
}
