local map = vim.keymap.set
local opts = { buffer = true, noremap = true, silent = true }

map("n", "<leader>x", ":Require<CR>", opts)
