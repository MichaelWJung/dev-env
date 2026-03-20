local plugins = {
  -- Colorscheme
  { "iCyMind/NeoSolarized" },

  -- Statusline
  { "vim-airline/vim-airline" },
  { "vim-airline/vim-airline-themes" },

  -- Tmux integration
  { "christoomey/vim-tmux-navigator" },
  { "edkolev/tmuxline.vim" },

  -- Snippets
  { "hrsh7th/vim-vsnip" },
  { "hrsh7th/vim-vsnip-integ" },

  -- LSP & related
  { "neovim/nvim-lspconfig" },
  { "p00f/clangd_extensions.nvim" },
  { "simrat39/rust-tools.nvim" },  -- note: somewhat legacy now; consider switching to rustaceanvim later

  -- Completion
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-vsnip" },

  -- FZF
  { "junegunn/fzf" },
  { "junegunn/fzf.vim" },

  -- Commenting
  { "tpope/vim-commentary" },

  -- Whitespace
  { "ntpeters/vim-better-whitespace" },

  -- Yank highlight
  { "machakann/vim-highlightedyank" },

  -- Auto pairs
  { "jiangmiao/auto-pairs" },

  -- Git
  { "tpope/vim-fugitive" },
  { "airblade/vim-gitgutter" },

  -- Repeat for plugin maps
  { "tpope/vim-repeat" },

  -- Surround
  { "tpope/vim-surround" },

  -- HTML closing tags
  { "alvan/vim-closetag" },

  -- Better PHP/HTML indent
  { "captbaritone/better-indent-support-for-php-with-html" },

  -- File browser enhancements
  { "tpope/vim-vinegar" },

  -- List toggle (quickfix/location)
  { "Valloric/ListToggle" },

  -- Clojure
  { "tpope/vim-fireplace" },
  { "guns/vim-sexp" },
  { "tpope/vim-sexp-mappings-for-regular-people" },

  -- Rainbow parens
  { "luochen1990/rainbow" },

  -- Quickly switch between header and source files
  -- { "vim-scripts/a.vim" },
}

-- Setup lazy.nvim
require("lazy").setup(plugins, {
  -- Optional but recommended settings
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
