-- Clear any existing autocommands in the numbertoggle group (equivalent to autocmd!)
local numbertoggle_group = vim.api.nvim_create_augroup("numbertoggle", { clear = true })

vim.api.nvim_create_autocmd(
  { "BufEnter", "FocusGained", "InsertLeave" },
  {
    group = numbertoggle_group,
    pattern = "*",
    callback = function()
      vim.opt.relativenumber = true
    end,
    desc = "Enable relative line numbers in normal mode / focused buffer",
  }
)

vim.api.nvim_create_autocmd(
  { "BufLeave", "FocusLost", "InsertEnter" },
  {
    group = numbertoggle_group,
    pattern = "*",
    callback = function()
      vim.opt.relativenumber = false
    end,
    desc = "Disable relative line numbers when leaving buffer / losing focus / entering insert",
  }
)

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_keymaps", { clear = true }),
  callback = function(ev)
    local map = vim.keymap.set
    local opts = { buffer = ev.buf, noremap = true, silent = true }

    -- Navigation / jump to
    map("n", "<leader>g", vim.lsp.buf.definition,        opts)  -- <Leader>g → definition
    map("n", "<leader>d", vim.lsp.buf.declaration,       opts)  -- <Leader>d → declaration
    map("n", "<leader>t", vim.lsp.buf.type_definition,   opts)  -- <Leader>t → type definition
    map("n", "<leader>u", vim.lsp.buf.references,        opts)  -- <Leader>u → references
    map("n", "<leader>i", vim.lsp.buf.implementation,    opts)  -- <Leader>i → implementation

    -- Actions & hover
    map("n", "K",         vim.lsp.buf.hover,             opts)  -- K → hover (very common)
    map({"n", "v"}, "<leader>a", vim.lsp.buf.code_action,       opts)  -- <Leader>a → code action
    map("n", "<F2>",      vim.lsp.buf.rename,            opts)  -- <F2> → rename
    map("n", "<leader>K", vim.lsp.buf.signature_help,    opts)  -- <Leader>K → signature help

    -- Formatting
    map({"n", "v"}, "<leader>f", vim.lsp.buf.format,            opts)  -- <Leader>f → format whole buffer

    -- Diagnostics navigation
    map("n", "<C-p>",     vim.diagnostic.goto_prev,      opts)  -- <C-p> → previous diagnostic
    map("n", "<C-n>",     vim.diagnostic.goto_next,      opts)  -- <C-n> → next diagnostic

    -- Inlay hints toggle (per buffer)
    map("n", "<leader>h", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, vim.tbl_extend("force", opts, { desc = "Toggle inlay hints" }))
  end,
  desc = "Set LSP keymaps on attach",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    local ft = vim.bo.filetype

    if ft == "rust" then
      vim.wo.colorcolumn = "101"
    elseif ft == "python" then
      vim.wo.colorcolumn = "80"
    elseif ft == "gitcommit" then
      vim.wo.colorcolumn = "73"
    else
      vim.wo.colorcolumn = "81"   -- global default for everything else
    end
  end,
  group = vim.api.nvim_create_augroup("colorcolumn_per_filetype", { clear = true }),
  desc = "Set colorcolumn with global default + overrides",
})
