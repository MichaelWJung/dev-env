local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- solarized colorscheme
Plug('iCyMind/NeoSolarized')

-- Nice vim statusline
Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')

-- Navigate seemlessly between vim and tmux splits
Plug('christoomey/vim-tmux-navigator')

-- Generate tmux statusline which matches vim’s
Plug('edkolev/tmuxline.vim')

-- Snippets
Plug('hrsh7th/vim-vsnip')
Plug('hrsh7th/vim-vsnip-integ')

-- Language client
Plug('neovim/nvim-lspconfig')
Plug('p00f/clangd_extensions.nvim')
Plug('simrat39/rust-tools.nvim')

Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-vsnip')

-- Multi-entry selection UI. Used by LanguageClient-neovim.
Plug('junegunn/fzf')
Plug('junegunn/fzf.vim')

-- Commenting
Plug('tpope/vim-commentary')

-- Highlight trailing whitespace
Plug('ntpeters/vim-better-whitespace')

-- Highlight yanked text
Plug('machakann/vim-highlightedyank')

-- Automatic pairs of (), [], etc.
Plug('jiangmiao/auto-pairs')

-- Git support inside vim
Plug('tpope/vim-fugitive')
Plug('airblade/vim-gitgutter')

-- Repeat (.) support for plugin maps
Plug('tpope/vim-repeat')

-- Surrounding with parentheses, brackets, etc.
Plug('tpope/vim-surround')

-- Add closing HTML tags
Plug('alvan/vim-closetag')

-- Better HTML indentation in PHP files
Plug('captbaritone/better-indent-support-for-php-with-html')

-- Enhance file browser
Plug('tpope/vim-vinegar')

-- Collection of language packs
-- Plug ('sheerun/vim-polyglot')

-- Shortcuts for toggling location and quick fix lists
Plug('Valloric/ListToggle')

-- Clojure stuff
Plug('tpope/vim-fireplace')
Plug('guns/vim-sexp')
Plug('tpope/vim-sexp-mappings-for-regular-people')

-- Rainbow parentheses
Plug('luochen1990/rainbow')

-- Quickly switch between header and source files
-- Plug('vim-scripts/a.vim')

vim.call('plug#end')
