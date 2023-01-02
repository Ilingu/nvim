local opt = vim.opt -- for conciseness

-- line numbers
opt.nu = true
opt.relativenumber = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.autoindent = true
opt.smartindent = true

-- line wrapping
opt.wrap = false

-- search
opt.hlsearch = true

opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- apparence
opt.termguicolors = true
opt.signcolumn = "yes"
opt.background = "dark"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")
