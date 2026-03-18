-- Set leader before plugins are loaded or mappings are set
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("plugins")
require("config.options")
require("config.autocmds")
require("config.keymaps")
require("config.highlights")
require("config.cmp")
require("config.lsp")
require("config.plugin-settings.airline")
require("config.plugin-settings.closetag")
require("config.plugin-settings.fzf")
require("config.plugin-settings.rainbow")
