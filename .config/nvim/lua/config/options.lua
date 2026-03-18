-- Encoding
vim.opt.fileencoding = "utf-8"

-- Indentation / tabs
vim.opt.tabstop     = 2          -- Number of spaces that a <Tab> in the file counts for.
vim.opt.shiftwidth  = 2          -- Number of spaces to use for each step of (auto)indent.
vim.opt.expandtab   = true       -- Use the appropriate number of spaces to insert a <Tab>.
                                 -- Spaces are used in indents with the '>' and '<' commands
                                 -- and when 'autoindent' is on. To insert a real tab when
                                 -- 'expandtab' is on, use CTRL-V <Tab>.
vim.opt.smarttab    = true       -- When on, a <Tab> in front of a line inserts blanks
                                 -- according to 'shiftwidth'. 'tabstop' is used in other
                                 -- places. A <BS> will delete a 'shiftwidth' worth of space
                                 -- at the start of the line.
vim.opt.autoindent  = true       -- Copy indent from current line when starting a new line
                                 -- (typing <CR> in Insert mode or when using the "o" or "O"
                                 -- command).
vim.opt.smartindent = true

-- Line numbers & matching
vim.opt.number         = true    -- Show line numbers.
vim.opt.relativenumber = true    -- Show relative line numbers.
vim.opt.showmatch      = true    -- When a bracket is inserted, briefly jump to the matching
                                 -- one. The jump is only done if the match can be seen on the
                                 -- screen. The time to show the match can be set with
                                 -- 'matchtime'.

-- Search
vim.opt.hlsearch   = true        -- When there is a previous search pattern, highlight all
                                 -- its matches.
vim.opt.incsearch  = true        -- While typing a search command, show immediately where the
                                 -- so far typed pattern matches.
vim.opt.ignorecase = true        -- Ignore case in search patterns.
vim.opt.smartcase  = true        -- Override the 'ignorecase' option if the search pattern
                                 -- contains upper case characters.

-- Text width & formatting
vim.opt.textwidth      = 80      -- Maximum width of text that is being inserted. A longer
                                 -- line will be broken after white space to get this width.
vim.opt.formatoptions  = "c,q,r,o,j"   -- This is a sequence of letters which describes how
                                       -- automatic formatting is to be done.

-- Status / UI / misc
vim.opt.laststatus     = 2       -- Display status line even if only one window is currently
                                 -- visible
vim.opt.list           = true    -- Enable highlighting of the listchars
vim.opt.listchars      = { tab = "» " }   -- highlight tabs
vim.opt.updatetime     = 100     -- After this time of inactivity the swapfile will be
                                 -- written. This affects the timing of the gitgutter plugin.
vim.opt.termguicolors  = true
vim.opt.mouse          = "a"
vim.opt.hidden         = true
vim.opt.backspace      = { "indent", "eol", "start" }

-- Folding
vim.opt.foldmethod = "syntax"    -- Fold files as defined by language syntax
vim.opt.foldenable = false       -- Do not fold by default
vim.opt.foldlevel  = 20          -- Deep default foldlevel so only innermost fold will be used
                                 -- by default

-- Visual aids
vim.opt.colorcolumn = "81"
vim.opt.wrap        = false

-- Colorscheme (needs to come after termguicolors)
vim.opt.background = "light"
vim.cmd("colorscheme NeoSolarized")

-- Doxygen syntax (global variable)
vim.g.load_doxygen_syntax = 1    -- Doxygen syntax highlighting by default

-- Tags search path
vim.opt.tags:append("./tags;$HOME")   -- Look for a tags file from the current directory upto $HOME.
