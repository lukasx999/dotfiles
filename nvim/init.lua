require("mappings")
require("config.lazy")
require("options")
require("autocmds")

vim.cmd [[filetype off]]
vim.opt.rtp:append("~/code/repos/seron/editor/vim")
vim.cmd [[filetype plugin indent on]]
