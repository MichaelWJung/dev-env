set nocompatible              " be iMproved, required


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" color schemes
Plugin 'altercation/vim-colors-solarized'

" tmux integration
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'edkolev/tmuxline.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'ntpeters/vim-better-whitespace'

Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'SirVer/ultisnips'

Plugin 'rust-lang/rust.vim'

"" The following are examples of different formats supported.
"" Keep Plugin commands between vundle#begin/end.
"" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
"" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
"" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line







set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

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

set showcmd         " Show (partial) command in status line.
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
set guioptions-=m   " remove menu bar
set guioptions-=T   " remove toolbar
set guioptions-=r   " remove right-hand scroll bar
set guioptions-=L   " remove left-hand scroll bar
set listchars=tab:»\  " highlight tabs
set list

syntax on

" Better recognition of gitcommit files when using the git worktree feature
autocmd FileType gitcommit setlocal textwidth=72
autocmd FileType gitcommit setlocal colorcolumn=73
autocmd BufNewFile,BufRead *.git/worktrees/**/COMMIT_EDITMSG setf gitcommit

let g:load_doxygen_syntax = 1 "Doxygen syntax highlighting by default

set colorcolumn=81
set nowrap

set nomousehide " Do not hide mouse cursor in gvim

set backspace=indent,eol,start

set t_Co=16
set background=light
colorscheme solarized

set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9

if !has('nvim')
    set ttymouse=sgr
endif
set mouse=a

" Easier navigation between splits
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

let mapleader="\<Space>"

nmap üü <C-]>
nmap güü g<C-]>
nmap <C-W>üü <C-W><C-]>

" Look for a tags file from the current directory upto $HOME.
set tags=./tags;$HOME

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <Leader>s :TagbarToggle<CR>
let g:tagbar_left=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowBookmarks=1
let NERDTreeQuitOnOpen=1
let NERDTreeChDirMode=0 " never change dir
"let NERDTreeChDirMode=2 " change dir whenever the tree root is changed

noremap <Leader>n :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcut for detailed diagnostics
let g:ycm_key_detailed_diagnostics = '<leader>d'
" Load .ycm_extra_conf.py from the following directory without confirmation
let g:ycm_extra_conf_globlist = ['~/hana/*','~/spatial/*']
" Close preview window after user leaves insert mode
let g:ycm_autoclose_preview_window_after_insertion = 1

nnoremap <Leader>g :YcmCompleter GoTo<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_rust_checkers = ['cargo']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger = "<C-J>"
let g:UltiSnipsJumpForwardTrigger = "<C-J>"
let g:UltiSnipsJumpBackwardTrigger = "<C-K>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl-P
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open ctrlp with leader-p
let g:ctrlp_map = '<Leader>o'
nmap <Leader>r :CtrlPMRU<CR>
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 0
"let g:ctrlp_user_command = 'ag %s -l --nocolor -g ••'
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'ag -l --nocolor -g "" %s'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1 "Use powerline fonts with airline
let g:airline#extensions#tabline#enabled = 1 "Enable tabline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DelimitMate
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoVim specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
    :tnoremap <Esc> <C-\><C-n>
    :tnoremap <C-j> <C-\><C-n><c-w>j
    :tnoremap <C-k> <C-\><C-n><c-w>k
    :tnoremap <C-h> <C-\><C-n><c-w>h
    :tnoremap <C-l> <C-\><C-n><c-w>l
endif
