
require("options") -- config dir is in runtimepath
require("neovide") -- neovide options
require("autocmds") -- autocmds
require("mappings") -- keymaps

-- Sets up lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath) -- will ask plugins if they have code for runtimepath (current file) == add lazy to runtimepath

-- require("lazy").setup("plugins")




require("lazy").setup("plugins", {
    -- Dont send notification on config file edit
    change_detection = {
        notify = false,
    },
})




