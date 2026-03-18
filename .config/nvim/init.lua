-- Set leader before plugins are loaded or mappings are set
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("plugins")
require("config.options")
require("config.autocmds")
require("config.keymaps")

-- Load old vimscript config
vim.cmd("source " .. vim.fn.stdpath("config") .. "/init-old.vim")
