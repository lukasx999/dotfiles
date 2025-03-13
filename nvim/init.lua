require("config.mappings")
require("config.lazy")
require("config.options")
require("config.autocmds")

vim.cmd [[filetype off]]
vim.opt.rtp:append("~/code/repos/seron/editor/vim")
vim.cmd [[filetype plugin indent on]]
