"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

" solarized colorscheme
Plug 'altercation/vim-colors-solarized'

" Nice vim statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Navigate seemlessly between vim and tmux splits
Plug 'christoomey/vim-tmux-navigator'

" Generate tmux statusline which matches vim’s
Plug 'edkolev/tmuxline.vim'

" Fuzzy search
Plug 'ctrlpvim/ctrlp.vim'

" A dependency of 'ncm2'.
Plug 'roxma/nvim-yarp'
" v2 of the nvim-completion-manager.
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

" Client for Language Server Protocol
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" Multi-entry selection UI. Used by LanguageClient-neovim.
Plug 'junegunn/fzf'

Plug 'roxma/LanguageServer-php-neovim',  {
    \ 'do': 'composer install && composer run-script parse-stubs'
    \ }

" Commenting
Plug 'tpope/vim-commentary'

" Snippets
Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'

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
Plug 'sheerun/vim-polyglot'

" Quickly switch between header and source files
" Plug'vim-scripts/a.vim'
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fenc=utf-8

set tabstop=4       " Number of spaces that a <Tab> in the file counts for.
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.
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
colorscheme solarized

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

" Remap backspace to remove automatic comment leaders as a whole.  As this
" interferes with auto-pairs we need to disable AutoPairsMapBS and call it
" manually.
inoremap <silent><expr> <bs> getline('.') =~# '^\s*\(//\\|#\\|%\\|"\)\s*$' ?
    \ "<c-u>" : "<C-R>=AutoPairsDelete()<CR>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto-pairs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interferes with the manually set backspace remap above. The behavior is
" manually added to the remap above.
let g:AutoPairsMapBS = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-commentary
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use // instead of /* */ comments for cpp and php files
autocmd FileType cpp,php setlocal commentstring=//\ %s


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
let g:UltiSnipsRemoveSelectModeMappings = 0

let g:UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
inoremap <silent> <expr> <C-J> ncm2_ultisnips#expand_or("\<C-J>", 'n')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" netrw (Default vim file browser)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_banner = 0
let g:netrw_liststyle = 0
noremap <Leader>n :Vexplore<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl-p
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<Leader>o'  " Shortcut to open ctrl-p
" If the file is already open in a window somewhere, do not jump to it
let g:ctrlp_switch_buffer = '0'
" Shortcut for recent files
nmap <Leader>r :CtrlPMRU<CR>
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ••'
" let g:ctrlp_user_command = {
"   \ 'types': {
"     \ 1: ['.git', 'ag -l --nocolor -g "" %s/{src/dir1,src/dir2}/'],
"     \ },
"   \ 'fallback': 'find %s -type f'
"   \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1 "Use powerline fonts with airline
let g:airline#extensions#tabline#enabled = 1 "Enable tabline


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ncm2
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable ncm2 in all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" Affects the visual representation of what happens after you hit <C-x><C-o>
" https://neovim.io/doc/user/insert.html#i_CTRL-X_CTRL-O
" https://neovim.io/doc/user/options.html#'completeopt'
"
" This will show the popup menu even if there's only one match (menuone),
" prevent automatic selection (noselect) and prevent automatic text injection
" into the current line (noinsert).
set completeopt=noinsert,menuone,noselect

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LanguageClient-neovim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:LanguageClient_settingsPath = $HOME.'/.config/nvim/settings.json'
let g:LanguageClient_serverCommands = {
\ 'cpp': ['cquery', '--language-server'],
\ 'rust': ['rustup', 'run', 'stable', 'rls'],
\ 'python': ['pyls'],
\ 'javascript.jsx': ['npx', 'javascript-typescript-stdio']
\ }
" \ 'cpp': ['cquery', '--language-server', '--log-file=/tmp/cq.log', '--log-stdin-stdout-to-stderr'],

" LC asks for completions with snippets
let g:LanguageClient_hasSnippetSupport = 1
" let g:LanguageClient_loggingLevel = 'DEBUG'
" let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <Leader>g :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <Leader>t :call LanguageClient_textDocument_typeDefinition()<CR>
nnoremap <silent> <Leader>i :call LanguageClient_textDocument_implementation()<CR>
nnoremap <silent> <Leader>u :call LanguageClient_textDocument_references()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>


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
