local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
  -- custom buffer-local setup
end

-- clangd
vim.lsp.config('clangd', {
  cmd = {
    "clangd",
    "--completion-style=detailed",
    -- "--header-insertion=never",
    "--suggest-missing-includes",
    "--cross-file-rename",
    "--clang-tidy",
  },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  capabilities = capabilities,
  on_attach = on_attach,
})

-- Haskell (hls)
vim.lsp.config('hls', {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.enable({'clangd', 'hls'})

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

vim.diagnostic.config({ virtual_text = true })
