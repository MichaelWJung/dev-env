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
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
Plug 'thomasfaingnaert/vim-lsp-snippets'
Plug 'thomasfaingnaert/vim-lsp-ultisnips'
" Plug 'mattn/vim-lsp-settings'

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
" vim-lsp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lsp_diagnostics_echo_cursor=1
let g:lsp_semantic_enabled=1
let g:lsp_highlight_references_enabled=1
nnoremap <silent> K :LspHover<CR>
nnoremap <silent> <Leader>g :LspDefinition<CR>
nnoremap <silent> <Leader>t :LspTypeDefinition<CR>
nnoremap <silent> <Leader>i :LspImplementation<CR>
nnoremap <silent> <Leader>p :LspPeekDefinition<CR>
nnoremap <silent> <Leader>P :LspPeekDeclaration<CR>
nnoremap <silent> <Leader>u :LspReferences<CR>
nnoremap <silent> <Leader>a :LspCodeAction<CR>
nnoremap <silent> <Leader>f :LspDocumentFormat<CR>
vnoremap <silent> <Leader>f :LspDocumentRangeFormat<CR>
nnoremap <silent> <F2> :LspRename<CR>
" nnoremap <silent> <Leader>e :call LanguageClient#explainErrorAtPoint()<CR>

if executable('clangd-10')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'clangd',
    \ 'cmd': ['clangd-10'],
    \ 'whitelist': ['cpp'],
    \ 'semantic_highlight': {
    \     'entity.name.function.cpp': 'CppFunction',
    \     'entity.name.function.method.cpp': 'CppMethod',
    \     'entity.name.function.method.static.cpp': 'CppStaticMethod',
    \     'entity.name.function.preprocessor.cpp': 'CppPreprocessor',
    \     'entity.name.namespace.cpp': 'CppNamespace',
    \     'entity.name.other.dependent.cpp': 'CppOtherDependent',
    \     'entity.name.type.class.cpp': 'CppClass',
    \     'entity.name.type.dependent.cpp': 'CppTypeDependent',
    \     'entity.name.type.enum.cpp': 'CppEnum',
    \     'entity.name.type.template.cpp': 'CppTemplate',
    \     'entity.name.type.typedef.cpp': 'CppTypedef',
    \     'meta.disabled': 'CppDisabled',
    \     'storage.type.primitive.cpp': 'CppPrimitiveType',
    \     'variable.other.cpp': 'CppOtherVariable',
    \     'variable.other.enummember.cpp': 'CppEnumMember',
    \     'variable.other.field.cpp': 'CppFieldVariable',
    \     'variable.other.field.static.cpp': 'CppFieldStaticVariable',
    \     'variable.other.local.cpp': 'CppLocalVariable',
    \     'variable.parameter.cpp': 'CppParameter'
    \ }
    \ })
endif

if executable('pyls')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'pyls',
    \ 'cmd': {server_info->['pyls']},
    \ 'whitelist': ['python'],
    \ })
endif

" Make it easier to set groups by color. Specific for the neosolarized color scheme.
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

hi! link CppFunction           Blue
hi! link CppMethod             Violet
hi! link CppStaticMethod       Magenta
hi! link CppPreprocessor       Orange
hi! link CppNamespace          Cyan
hi! link CppOtherDependent     Black
hi! link CppClass              Red
hi! link CppTypeDependent      Gray
hi! link CppEnum               Yellow
hi! link CppTemplate           Green
hi! link CppTypedef            Red
hi! link CppDisabled           Gray
hi! link CppPrimitiveType      Magenta
hi! link CppOtherVariable      Orange
hi! link CppEnumMember         Orange
hi! link CppFieldVariable      Cyan
hi! link CppFieldStaticVariable Orange
hi! link CppLocalVariable      Black
hi! link CppParameter          Yellow

hi! link cStorageClass         Green
hi! link cType                 Magenta
hi! link cppStructure          Green


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" asyncomplete.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
  \ 'name': 'ultisnips',
  \ 'whitelist': ['*'],
  \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
  \ }))

call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
  \ 'name': 'file',
  \ 'whitelist': ['*'],
  \ 'priority': 10,
  \ 'completor': function('asyncomplete#sources#file#completor')
  \ }))

call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
  \ 'name': 'buffer',
  \ 'whitelist': ['*'],
  \ 'completor': function('asyncomplete#sources#buffer#completor'),
  \ 'config': {
  \    'max_buffer_size': 5000000,
  \ },
  \ }))

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype-specific settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType php LanguageClientStart
autocmd FileType php,html,javascript setlocal shiftwidth=2

autocmd FileType python setlocal textwidth=79
autocmd FileType python setlocal colorcolumn=80

let g:html_indent_inctags="p"
let g:html_indent_autotags="html,head,body"

autocmd FileType gitcommit setlocal textwidth=72
autocmd FileType gitcommit setlocal colorcolumn=73
