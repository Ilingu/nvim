-- keymap leader to space 
vim.g.mapleader = " "
local keymap = vim.keymap

---------------------
-- General Keymaps
---------------------

keymap.set("n", "<C-s>", vim.cmd.w) -- save file

keymap.set("i", "jk", "<ESC>") -- to return to normal mode faster
keymap.set("n", "<leader>nh", ":nohl<CR>") -- faster :noh

keymap.set("n", "x", '"_x') -- do not copy when pressing x

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- moving selection up/down
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- moving vertically
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- greatest remap ever, copy/paste without keeping buffer
keymap.set("x", "<leader>p", [["_dP]])
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

-- default formatter
keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- search
keymap.set("n", "<leader>h", [[:%s/old/new/gI<Left><Left><Left>]])
keymap.set("n", "<leader>s", [[/old]])

----------------------
-- Plugin Keybinds
----------------------

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fg", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fgit", "<cmd>Telescope git_files<cr>") -- list available help tags

-- nvim-tree
vim.keymap.set("n", "<C-b>", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<C-p>", vim.cmd.NvimTreeFocus)

-- fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git);

-- undotree 
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- Comments keybindings

--[[ Basic mappings
These mappings are enabled by default. (config: mappings.basic)

NORMAL mode
`gcc` - Toggles the current line using linewise comment
`gbc` - Toggles the current line using blockwise comment
`[count]gcc` - Toggles the number of line given as a prefix-count using linewise
`[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
`gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
`gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comment
VISUAL mode
`gc` - Toggles the region using linewise comment
`gb` - Toggles the region using blockwise comment

Extra mappings
These mappings are enabled by default. (config: mappings.extra)

NORMAL mode
`gco` - Insert comment to the next line and enters INSERT mode
`gcO` - Insert comment to the previous line and enters INSERT mode
`gcA` - Insert comment to end of the current line and enters INSERT mode
Examples
# Linewise

`gcw` - Toggle from the current cursor position to the next word
`gc$` - Toggle from the current cursor position to the end of line
`gc}` - Toggle until the next blank line
`gc5j` - Toggle 5 lines after the current cursor position
`gc8k` - Toggle 8 lines before the current cursor position
`gcip` - Toggle inside of paragraph
`gca}` - Toggle around curly brackets

# Blockwise

`gb2}` - Toggle until the 2 next blank line
`gbac` - Toggle comment around a class (w/ LSP/treesitter support)
`gbaf` - Toggle comment around a function (w/ LSP/treesitter support) ]]
