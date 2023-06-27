"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

" solarized colorscheme
Plug 'iCyMind/NeoSolarized'

" Nice vim statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Navigate seemlessly between vim and tmux splits
Plug 'christoomey/vim-tmux-navigator'

" Generate tmux statusline which matches vim’s
Plug 'edkolev/tmuxline.vim'

" Snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Language client
Plug 'neovim/nvim-lspconfig'
Plug 'p00f/clangd_extensions.nvim'
Plug 'simrat39/rust-tools.nvim'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'

" Multi-entry selection UI. Used by LanguageClient-neovim.
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Commenting
Plug 'tpope/vim-commentary'

" Highlight trailing whitespace
Plug 'ntpeters/vim-better-whitespace'

" Highlight yanked text
Plug 'machakann/vim-highlightedyank'

" Automatic pairs of (), [], etc.
Plug 'jiangmiao/auto-pairs'

" Git support inside vim
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Repeat (.) support for plugin maps
Plug 'tpope/vim-repeat'

" Surrounding with parentheses, brackets, etc.
Plug 'tpope/vim-surround'

" Add closing HTML tags
Plug 'alvan/vim-closetag'

" Better HTML indentation in PHP files
Plug 'captbaritone/better-indent-support-for-php-with-html'

" Enhance file browser
Plug 'tpope/vim-vinegar'

" Collection of language packs
" Plug 'sheerun/vim-polyglot'

" Shortcuts for toggling location and quick fix lists
Plug 'Valloric/ListToggle'

" Clojure stuff
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'

" Rainbow parentheses
Plug 'luochen1990/rainbow'

" Quickly switch between header and source files
" Plug 'vim-scripts/a.vim'
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fenc=utf-8

set tabstop=2       " Number of spaces that a <Tab> in the file counts for.
set shiftwidth=2    " Number of spaces to use for each step of (auto)indent.
set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
                    " Spaces are used in indents with the '>' and '<' commands
                    " and when 'autoindent' is on. To insert a real tab when
                    " 'expandtab' is on, use CTRL-V <Tab>.
set smarttab        " When on, a <Tab> in front of a line inserts blanks
                    " according to 'shiftwidth'. 'tabstop' is used in other
                    " places. A <BS> will delete a 'shiftwidth' worth of space
                    " at the start of the line.
set autoindent      " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).
set smartindent

set number          " Show line numbers.
set relativenumber  " Show relative line numbers.
set showmatch       " When a bracket is inserted, briefly jump to the matching
                    " one. The jump is only done if the match can be seen on the
                    " screen. The time to show the match can be set with
                    " 'matchtime'.

set hlsearch        " When there is a previous search pattern, highlight all
                    " its matches.
set incsearch       " While typing a search command, show immediately where the
                    " so far typed pattern matches.
set ignorecase      " Ignore case in search patterns.
set smartcase       " Override the 'ignorecase' option if the search pattern
                    " contains upper case characters.

set textwidth=80    " Maximum width of text that is being inserted. A longer
                    " line will be broken after white space to get this width.
set formatoptions=c,q,r,o,j " This is a sequence of letters which describes how
                    " automatic formatting is to be done.
set laststatus=2    " Display status line even if only one window is currently
                    " visible
set listchars=tab:»\  " highlight tabs
set list            " Enable highlighting of the listchars
set updatetime=100  " After this time of inactivity the swapfile will be
                    " written. This affects the timing of the gitgutter plugin.
set foldmethod=syntax " Fold files as defined by language syntax
set nofoldenable    " Do not fold by default
set foldlevel=20    " Deep default foldlevel so only innermost fold will be used
                    " by default
set termguicolors

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

syntax on

let g:load_doxygen_syntax = 1 "Doxygen syntax highlighting by default

set colorcolumn=81
set nowrap

set backspace=indent,eol,start

set background=light
colorscheme NeoSolarized

set mouse=a

set hidden

" Easier navigation among splits
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

let mapleader="\<Space>"

" The <C-]> combination is not really accesible with the NEO keyboard layout
nmap üü <C-]>
nmap güü g<C-]>
nmap <C-W>üü <C-W><C-]>
nmap öö <C-^>

" Get out of terminal mode with <Esc>
tnoremap <Esc> <C-\><C-n>
" Make <Esc> key available again with <C-v> prefix
tnoremap <C-v><Esc> <Esc>

" Enable built-in matchit plugin
runtime macros/matchit.vim

" Look for a tags file from the current directory upto $HOME.
set tags=./tags;$HOME


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
