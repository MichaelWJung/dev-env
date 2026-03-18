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
