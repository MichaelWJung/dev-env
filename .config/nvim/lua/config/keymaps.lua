local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Easier navigation among splits
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- NEO keyboard layout workarounds
-- The <C-]> combination is not really accesible with the NEO keyboard layout
map("n", "üü", "<C-]>",   opts)
map("n", "güü", "g<C-]>", opts)
map("n", "<C-w>üü", "<C-w><C-]>", opts)
map("n", "öö", "<C-^>",   opts)

-- Terminal mode: Esc to normal mode
map("t", "<Esc>", [[<C-\><C-n>]], opts)

-- Allow sending real <Esc> to terminal with <C-v><Esc>
map("t", "<C-v><Esc>", "<Esc>", opts)
