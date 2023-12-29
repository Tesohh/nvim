vim.g.mapleader = " "

if vim.loop.os_uname().sysname == "Darwin" then
    vim.cmd([[language en_US]])
end

if vim.g.vscode then
    require("vscode.keymaps")

    vim.opt.ignorecase = true
    vim.opt.smartcase = true
    vim.opt.hlsearch = true

    vim.opt.clipboard = "unnamedplus"
else
    -- ordinary Neovim
    require("nv.opts")
    require("nv.lazy")
end
