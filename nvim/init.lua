require("mappings")
require("config.lazy")
require("options")
require("autocmds")

vim.cmd [[filetype off]]
vim.opt.rtp:append("~/Code/Projects/sprox/editor/vim")
vim.cmd [[filetype plugin indent on]]
