local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Rust (rust-tools)
require("rust-tools").setup({
  server = {
    on_attach = function(client, bufnr)
      -- Add buffer-local things here if needed
    end,
    capabilities = capabilities,
  },
})

-- clangd
require("lspconfig").clangd.setup({
  cmd = { "clangd", "--completion-style=detailed" },
  capabilities = capabilities,
})

-- Haskell (hls)
require("lspconfig").hls.setup({
  capabilities = capabilities,
})

-- Enable inlay hints automatically on attach
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
  group = vim.api.nvim_create_augroup("lsp_inlay_hints", { clear = true }),
})
