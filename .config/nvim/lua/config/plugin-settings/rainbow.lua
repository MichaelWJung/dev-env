vim.g.rainbow_active = 1  -- 1 = always on, 0 = off until :RainbowToggle

vim.g.rainbow_conf = {
  ctermfgs    = { "136", "166", "160", "125", "61", "33", "37", "64" },
  guis        = { "" },
  cterms      = { "" },
  operators   = "_,_",
  parentheses = {
    "start=/(/ end=/)/ fold",
    "start=/\\[/ end=/\\]/ fold",
    "start=/{/ end=/}/ fold",
  },
}
