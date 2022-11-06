local opt = vim.opt -- for conciseness

-- essential
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.cmd("language en_US")
vim.cmd("set noshowmode")
vim.opt.shell = "powershell"
vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command "
vim.opt.shellxquote = ""
vim.opt.shellquote = ""
vim.opt.shellredir = "2>&1 | Out-File -Encoding UTF8 %s"
vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s"

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.autoindent = true
opt.smartindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

--appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")
