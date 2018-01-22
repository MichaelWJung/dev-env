" Plugins
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

" Auto completion, etc.
Plug 'Valloric/YouCompleteMe'

" Commenting
Plug 'tpope/vim-commentary'

" Snippets
Plug 'SirVer/ultisnips'

" Highlight trailing whitespace
Plug 'ntpeters/vim-better-whitespace'

" Automatic pairs of (), [], etc.
Plug 'jiangmiao/auto-pairs'

" Git support inside vim
Plug 'tpope/vim-fugitive'

" Repeat (.) support for plugin maps
Plug 'tpope/vim-repeat'

" Surrounding with parentheses, brackets, etc.
Plug 'tpope/vim-surround'

" Enhance file browser
Plug 'tpope/vim-vinegar'
call plug#end()


" General settings
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

let g:load_doxygen_syntax = 1 "Doxygen syntax highlighting by default

syntax on

set colorcolumn=81
set nowrap

set backspace=indent,eol,start

set background=light
colorscheme solarized

set mouse=a

"Shortcuts for navigation among splits
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

let mapleader="\<Space>"

" Remap some combinations that are not really accessible on the NEO keyboard
" layout
nmap üü <C-]>
nmap güü g<C-]>
nmap <C-W>üü <C-W><C-]>
nmap öö <C-^>

" Get out of terminal mode with <Esc>
tnoremap <Esc> <C-\><C-n>
" Make <Esc> key available again with <C-v> prefix
tnoremap <C-v><Esc> <Esc>

" Look for a tags file from the current directory upto $HOME.
set tags=./tags;$HOME


" Special handling of git commit messages
autocmd FileType gitcommit setlocal textwidth=72
autocmd FileType gitcommit setlocal colorcolumn=73
autocmd BufNewFile,BufRead *.git/worktrees/**/COMMIT_EDITMSG setf gitcommit

" netrw (Default vim file browser)
let g:netrw_banner = 0
let g:netrw_liststyle = 0
noremap <Leader>n :Vexplore<CR>

" Airline
let g:airline_powerline_fonts = 1 "Use powerline fonts with airline
let g:airline#extensions#tabline#enabled = 1 "Enable tabline


" Ctrl-p
let g:ctrlp_map = '<Leader>o'  " Shortcut to open ctrl-p
" Shortcut for recent files
nmap <Leader>r :CtrlPMRU<CR>
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ••'


" vim-commentary
" Use // instead of /* */ comments for cpp files
autocmd FileType cpp setlocal commentstring=//\ %s


" YouCompleteMe
nnoremap <Leader>g :YcmCompleter GoTo<CR>
let g:ycm_key_detailed_diagnostics = '<leader>d'
" Close preview window after user leaves insert mode
" let g:ycm_autoclose_preview_window_after_insertion = 1


" UtliSnips
let g:UltiSnipsExpandTrigger = "<C-J>"
let g:UltiSnipsJumpForwardTrigger = "<C-J>"
let g:UltiSnipsJumpBackwardTrigger = "<C-K>"









" Old stuff
"
"Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/nerdcommenter'
"Plugin 'Raimondi/delimitMate'

" Plug 'majutsushi/tagbar'

"
"let NERDTreeShowBookmarks=1
"let NERDTreeQuitOnOpen=1
"let NERDTreeChDirMode=0 " never change dir
""let NERDTreeChDirMode=2 " change dir whenever the tree root is changed
"
"noremap <Leader>n :NERDTreeToggle<CR>
"noremap <Leader>s :TagbarToggle<CR>
"
"let g:tagbar_left=1
"
"let delimitMate_expand_cr = 2
"let delimitMate_expand_space = 1
