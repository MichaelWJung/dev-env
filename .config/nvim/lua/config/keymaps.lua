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

-- vim-vsnip: Jump between snippet placeholders
-- Forward / next
map({ "i", "s" }, "<C-j>", function()
  if vim.fn["vsnip#jumpable"](1) == 1 then
    return "<Plug>(vsnip-jump-next)"
  else
    return "<C-j>"
  end
end, { expr = true, remap = false, silent = true, desc = "vsnip: Jump to next placeholder or fallback to <C-j>" })

-- Backward / previous
map({ "i", "s" }, "<C-k>", function()
  if vim.fn["vsnip#jumpable"](-1) == 1 then
    return "<Plug>(vsnip-jump-prev)"
  else
    return "<C-k>"
  end
end, { expr = true, remap = false, silent = true, desc = "vsnip: Jump to previous placeholder or fallback to <C-k>" })

map("n", "<leader>o", ":FzfFiles<CR>",    opts)
map("n", "<leader>r", ":FzfHistory<CR>",  opts)

-- Open netrw in left vertical split (Vinegar-style)
map("n", "<leader>n", ":Vexplore<CR>", opts)
