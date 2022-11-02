vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- general keymaps
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "x", '"_x') -- Dont copy to clipboard when i press x
keymap.set("n", "<leader>=", "<C-a>") -- Increment with leader=
keymap.set("n", "<leader>-", "<C-x>") -- Decrement with leader-
keymap.set("n", "<c-z>", "<nop>")
keymap.set("v", "<c-z>", "<nop>")
keymap.set("n", "q", "<nop>")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>") -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>") --  go to previous tab

-- Buffers
keymap.set("n", "<leader>bx", "<cmd>w<CR><cmd>bw<CR>") -- save and quit buffer
keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<CR>") --  go to next buffer
keymap.set("n", "<leader>bp", "<cmd>BufferLineCyclePrev<CR>") --  go to previous buffer
keymap.set("n", "<leader>bN", "<cmd>BufferLineMoveNext<cr>") -- move buffer to the right
keymap.set("n", "<leader>bP", "<cmd>BufferLineMovePrev<cr>") -- move buffer to the left
keymap.set("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>")
keymap.set("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>")
keymap.set("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>")
keymap.set("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>")
keymap.set("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>")
keymap.set("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>")
keymap.set("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>")
keymap.set("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>")
keymap.set("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>")

-- plugin keymaps

-- vim-maximizer
keymap.set("n", "<leader>sm", "<cmd>MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>fp", "<cmd>lua require'telescope.builtin'.treesitter{}<cr>") -- symbol search, like ctrl+p @ in vscode

-- toggle-terminal
keymap.set("n", "<leader>tt", "<cmd>ToggleTerm size=60 direction=vertical<cr>")
keymap.set("t", "<esc>", "<C-\\><C-n>")

-- trouble & todo
keymap.set("n", "<leader>tr", "<cmd>Trouble<cr>")
keymap.set("n", "<leader>td", "<cmd>TodoTrouble<cr>")
