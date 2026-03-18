"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntax on

" Enable built-in matchit plugin
" runtime macros/matchit.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-commentary
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use // instead of /* */ comments for cpp and php files
autocmd FileType cpp,php setlocal commentstring=//\ %s
autocmd FileType cmake setlocal commentstring=#\ %s


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-closetag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:closetag_filenames = "*.html,*.php,*.jsx"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-vsnip
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jump forward or backward
imap <expr> <C-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-j>'
smap <expr> <C-j>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-j>'
imap <expr> <C-k>   vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-k>'
smap <expr> <C-k>   vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-k>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" netrw (Default vim file browser)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_banner = 0
let g:netrw_liststyle = 0
noremap <Leader>n :Vexplore<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_command_prefix = 'Fzf'
nmap <silent> <Leader>o :FzfFiles<CR>
nmap <silent> <Leader>r :FzfHistory<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1 "Use powerline fonts with airline
let g:airline#extensions#tabline#enabled = 1 "Enable tabline


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lsp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <Leader>g <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <Leader>d <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <Leader>t <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <Leader>u <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <Leader>i <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <Leader>a <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <Leader>f <cmd>lua vim.lsp.buf.format()<CR>
" vnoremap <silent> <Leader>f <cmd>lua vim.lsp.buf.range_formatting()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <F2> <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <Leader>K <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

nnoremap <silent> <Leader>h <cmd>lua vim.lsp.buf.inlay_hint(0)<CR>

lua vim.keymap.set('v', '<Leader>a', vim.lsp.buf.code_action, {remap = false})
lua vim.keymap.set('v', '<Leader>f', vim.lsp.buf.format, {remap = false})


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-fireplace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au Filetype clojure nnoremap <silent> <Leader>x :Require<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rainbow parentheses
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

let g:rainbow_conf = {
\    'ctermfgs': ['136', '166', '160', '125', '61', '33', '37', '64'],
\    'guis': [''],
\    'cterms': [''],
\    'operators': '_,_',
\    'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype-specific settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType php LanguageClientStart
autocmd FileType php,html,javascript,css setlocal shiftwidth=2

autocmd FileType rust setlocal textwidth=100
autocmd FileType rust setlocal colorcolumn=101

autocmd FileType python setlocal textwidth=79
autocmd FileType python setlocal colorcolumn=80

let g:html_indent_inctags="p"
let g:html_indent_autotags="html,head,body"

autocmd FileType gitcommit setlocal textwidth=72
autocmd FileType gitcommit setlocal colorcolumn=73


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Semantic Highlighting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi! link Black Normal
hi! link Gray Comment
hi! link Cyan Constant
hi! link Blue Identifier
hi! link Green Statement
hi! link Orange PreProc
hi! link Yellow Type
hi! link Red Special
hi! link Violet Underlined
hi! link Magenta helpNote

hi! link @lsp.type.namespace          Cyan
hi! link @lsp.type.type               Red
hi! link @lsp.type.class              Red
hi! link @lsp.type.enum               Yellow
hi! link @lsp.type.interface          Red
hi! link @lsp.type.struct             Green
hi! link @lsp.type.typeParameter      Red
hi! link @lsp.type.parameter          Yellow
hi! link @lsp.type.variable           Black
hi! link @lsp.type.property           Yellow
hi! link @lsp.type.enumMember         Orange
hi! link @lsp.type.event              Violet
hi! link @lsp.type.function           Blue
hi! link @lsp.type.method             Violet
hi! link @lsp.type.macro              Orange
hi! link @lsp.type.keyword            Green
hi! link @lsp.type.modifier           Yellow
hi! link @lsp.type.comment            Gray
hi! link @lsp.type.string             Green
hi! link @lsp.type.number             Yellow
hi! link @lsp.type.regexp             Green
hi! link @lsp.type.operator           Violet
hi! link @lsp.type.decorator          Violet

lua <<EOF
-- Helper function for nvim-cmp / vim-vsnip
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- Helper function for nvim-cmp / vim-vsnip
local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<C-j>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  }),
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.recently_used,
      require("clangd_extensions.cmp_scores"),
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  }
})

-- Set configuration for specific filetype.
-- cmp.setup.filetype('gitcommit', {
--   sources = cmp.config.sources({
--     { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
--   }, {
--     { name = 'buffer' },
--   })
-- })

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- require'lspconfig'.rls.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'rust-tools'.setup{
  server = {
    on_attach = my_on_attach
  }
}
require'lspconfig'.clangd.setup{
  cmd = { "clangd", "--completion-style=detailed" },
  capabilities = capabilities
}
-- require'clangd_extensions'.setup{
--   server = {
--     cmd = { "clangd" },
--     on_attach = my_on_attach
--   },
--   capabilities = capabilities
-- }
require'lspconfig'.hls.setup{}

-- Enable inlay hints when language server is attached
vim.api.nvim_create_autocmd({"LspAttach"}, {
  callback = function()
    vim.lsp.buf.inlay_hint(0, true)
  end
})

EOF
