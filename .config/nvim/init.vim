"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

" solarized colorscheme
" Plug 'altercation/vim-colors-solarized'
Plug 'iCyMind/NeoSolarized'

" Nice vim statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Navigate seemlessly between vim and tmux splits
Plug 'christoomey/vim-tmux-navigator'

" Generate tmux statusline which matches vim’s
Plug 'edkolev/tmuxline.vim'

" Snippets
Plug 'SirVer/ultisnips'

" Language client
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-buffer.vim'
" Plug 'prabirshrestha/asyncomplete-file.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
" Plug 'thomasfaingnaert/vim-lsp-snippets'
" Plug 'thomasfaingnaert/vim-lsp-ultisnips'
" Plug 'mattn/vim-lsp-settings'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'simrat39/rust-tools.nvim'
Plug 'p00f/clangd_extensions.nvim'
Plug 'theHamsta/nvim-semantic-tokens'
" Plug 'nvim-lua/lsp_extensions.nvim'

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
" colorscheme solarized
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
" UtliSnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsSnippetsDir = $HOME."/.config/nvim/UltiSnips/"
let g:UltiSnipsJumpForwardTrigger = "<C-J>"
let g:UltiSnipsJumpBackwardTrigger = "<C-K>"
let g:UltiSnipsExpandTrigger = "<C-J>"
let g:UltiSnipsRemoveSelectModeMappings = 0


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

" autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
" autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs
"       \ :lua require'lsp_extensions'.inlay_hints{
"       \     prefix = ' » ', enabled = {"TypeHint", "ChainingHint", "ParameterHint"}
"       \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-lsp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:lsp_diagnostics_echo_cursor=1
" let g:lsp_semantic_enabled=1
" let g:lsp_highlight_references_enabled=1
" nnoremap <silent> K :LspHover<CR>
" nnoremap <silent> <Leader>g :LspDefinition<CR>
" nnoremap <silent> <Leader>t :LspTypeDefinition<CR>
" nnoremap <silent> <Leader>i :LspImplementation<CR>
" nnoremap <silent> <Leader>p :LspPeekDefinition<CR>
" nnoremap <silent> <Leader>P :LspPeekDeclaration<CR>
" nnoremap <silent> <Leader>u :LspReferences<CR>
" nnoremap <silent> <Leader>a :LspCodeAction<CR>
" nnoremap <silent> <Leader>f :LspDocumentFormat<CR>
" vnoremap <silent> <Leader>f :LspDocumentRangeFormat<CR>
" nnoremap <silent> <F2> :LspRename<CR>
" " nnoremap <silent> <Leader>e :call LanguageClient#explainErrorAtPoint()<CR>

" if executable('clangd')
"   au User lsp_setup call lsp#register_server({
"     \ 'name': 'clangd',
"     \ 'cmd': ['clangd', "--header-insertion=never",
"     \                   "--suggest-missing-includes",
"     \                   "--cross-file-rename",
"     \                   "--clang-tidy"],
"     \ 'whitelist': ['cpp'],
"     \ 'semantic_highlight': {
"     \     'entity.name.function.cpp': 'CppFunction',
"     \     'entity.name.function.method.cpp': 'CppMethod',
"     \     'entity.name.function.method.static.cpp': 'CppStaticMethod',
"     \     'entity.name.function.preprocessor.cpp': 'CppPreprocessor',
"     \     'entity.name.namespace.cpp': 'CppNamespace',
"     \     'entity.name.other.dependent.cpp': 'CppOtherDependent',
"     \     'entity.name.type.class.cpp': 'CppClass',
"     \     'entity.name.type.dependent.cpp': 'CppTypeDependent',
"     \     'entity.name.type.enum.cpp': 'CppEnum',
"     \     'entity.name.type.template.cpp': 'CppTemplate',
"     \     'entity.name.type.typedef.cpp': 'CppTypedef',
"     \     'meta.disabled': 'CppDisabled',
"     \     'storage.type.primitive.cpp': 'CppPrimitiveType',
"     \     'variable.other.cpp': 'CppOtherVariable',
"     \     'variable.other.enummember.cpp': 'CppEnumMember',
"     \     'variable.other.field.cpp': 'CppFieldVariable',
"     \     'variable.other.field.static.cpp': 'CppFieldStaticVariable',
"     \     'variable.other.local.cpp': 'CppLocalVariable',
"     \     'variable.parameter.cpp': 'CppParameter'
"     \ }
"     \ })
" endif

" if executable('pyls')
"   au User lsp_setup call lsp#register_server({
"     \ 'name': 'pyls',
"     \ 'cmd': {server_info->['pyls']},
"     \ 'whitelist': ['python'],
"     \ 'workspace_config': {'pyls': {
"     \     'configurationSources': ['flake8'],
"     \     'plugins': {'pylint': {'enabled': v:true}}
"     \ }}})
"     \ })
" endif

" if executable('clojure-lsp')
"   au User lsp_setup call lsp#register_server({
"     \ 'name': 'clojure-lsp',
"     \ 'cmd': ['bash', '-c', '/home/mjung/.local/bin/clojure-lsp'],
"     \ 'whitelist': ['clojure']
"     \ })
" endif

" if executable('rls')
"   au User lsp_setup call lsp#register_server({
"     \ 'name': 'rls',
"     \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
"     \ 'whitelist': ['rust'],
"     \ })
" endif

" " 'rust': ['rustup', 'run', 'stable', 'rls'],
" " 'python': ['pyls'],
" " 'javascript.jsx': ['npx', 'javascript-typescript-stdio'],

" " Make it easier to set groups by color. Specific for the neosolarized color scheme.
" hi! link Black Normal
" hi! link Gray Comment
" hi! link Cyan Constant
" hi! link Blue Identifier
" hi! link Green Statement
" hi! link Orange PreProc
" hi! link Yellow Type
" hi! link Red Special
" hi! link Violet Underlined
" hi! link Magenta helpNote

" hi! link CppFunction           Blue
" hi! link CppMethod             Violet
" hi! link CppStaticMethod       Magenta
" hi! link CppPreprocessor       Orange
" hi! link CppNamespace          Cyan
" hi! link CppOtherDependent     Black
" hi! link CppClass              Red
" hi! link CppTypeDependent      Gray
" hi! link CppEnum               Yellow
" hi! link CppTemplate           Green
" hi! link CppTypedef            Red
" hi! link CppDisabled           Gray
" hi! link CppPrimitiveType      Magenta
" hi! link CppOtherVariable      Orange
" hi! link CppEnumMember         Orange
" hi! link CppFieldVariable      Cyan
" hi! link CppFieldStaticVariable Orange
" hi! link CppLocalVariable      Black
" hi! link CppParameter          Yellow

" hi! link cStorageClass         Green
" hi! link cType                 Magenta
" hi! link cppStructure          Green


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" asyncomplete.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
"   \ 'name': 'ultisnips',
"   \ 'whitelist': ['*'],
"   \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
"   \ }))

" call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
"   \ 'name': 'file',
"   \ 'whitelist': ['*'],
"   \ 'priority': 10,
"   \ 'completor': function('asyncomplete#sources#file#completor')
"   \ }))
" 
" call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
"   \ 'name': 'buffer',
"   \ 'whitelist': ['*'],
"   \ 'completor': function('asyncomplete#sources#buffer#completor'),
"   \ 'config': {
"   \    'max_buffer_size': 5000000,
"   \ },
"   \ }))
" 
" inoremap <c-space> <Plug>(asyncomplete_force_refresh)
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"


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

hi! link LspNamespace          Cyan
hi! link LspType               Red
hi! link LspClass              Red
hi! link LspEnum               Yellow
hi! link LspInterface          Red
hi! link LspStruct             Green
hi! link LspTypeParameter      Red
hi! link LspParameter          Yellow
hi! link LspVariable           Black
hi! link LspProperty           Yellow
hi! link LspEnumMember         Orange
hi! link LspEvent              Violet
hi! link LspFunction           Blue
hi! link LspMethod             Violet
hi! link LspMacro              Orange
hi! link LspKeyword            Green
hi! link LspModifier           Yellow
hi! link LspComment            Gray
hi! link LspString             Green
hi! link LspNumber             Yellow
hi! link LspRegexp             Green
hi! link LspOperator           Violet

" hi! link CppFunction           Blue
" hi! link CppMethod             Violet
" hi! link CppStaticMethod       Magenta
" hi! link CppPreprocessor       Orange
" hi! link CppNamespace          Cyan
" hi! link CppOtherDependent     Black
" hi! link CppClass              Red
" hi! link CppTypeDependent      Gray
" hi! link CppEnum               Yellow
" hi! link CppTemplate           Green
" hi! link CppTypedef            Red
" hi! link CppDisabled           Gray
" hi! link CppPrimitiveType      Magenta
" hi! link CppOtherVariable      Orange
" hi! link CppEnumMember         Orange
" hi! link CppFieldVariable      Cyan
" hi! link CppFieldStaticVariable Orange
" hi! link CppLocalVariable      Black
" hi! link CppParameter          Yellow

" hi! link cStorageClass         Green
" hi! link cType                 Magenta
" hi! link cppStructure          Green

lua <<EOF
local my_on_attach = function(client, bufnr)
    local caps = client.server_capabilities
    if caps.semanticTokensProvider and caps.semanticTokensProvider.full then
      local augroup = vim.api.nvim_create_augroup("SemanticTokens", {})
      vim.api.nvim_create_autocmd("TextChanged", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.semantic_tokens_full()
        end,
      })
      -- fire it first time on load as well
      vim.lsp.buf.semantic_tokens_full()
    end
end

-- require'lspconfig'.rls.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'rust-tools'.setup{
  server = {
    on_attach = my_on_attach
  }
}
-- require'lspconfig'.clangd.setup{
--   cmd = { "clangd-14" };
-- }
require'clangd_extensions'.setup{
  server = {
    cmd = { "clangd-14" },
    on_attach = my_on_attach
  }
}
require'lspconfig'.hls.setup{}

vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = false;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
    treesitter = true;
  };
}
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
--  elseif vim.fn.call("vsnip#available", {1}) == 1 then
--    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

require("nvim-semantic-tokens").setup {
  preset = "default",
  -- highlighters is a list of modules following the interface of nvim-semantic-tokens.table-highlighter or 
  -- function with the signature: highlight_token(ctx, token, highlight) where 
  --        ctx (as defined in :h lsp-handler)
  --        token  (as defined in :h vim.lsp.semantic_tokens.on_full())
  --        highlight (a helper function that you can call (also multiple times) with the determined highlight group(s) as the only parameter)
  highlighters = { require 'nvim-semantic-tokens.table-highlighter'}
}

EOF
