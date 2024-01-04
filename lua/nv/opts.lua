local opt = {
    expandtab = true,
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    smartindent = true,
    clipboard = "unnamedplus",
    ignorecase = true,
    smartcase = true,
    hlsearch = true,
    scrolloff = 8,
    showmode = false,
    signcolumn = "yes:1",
    cmdheight = 0,
}

local g = {
    mapleader = " ",
}

local wo = {
    wrap = false,
}

for k, v in pairs(opt) do
    vim.opt[k] = v
end

for k, v in pairs(g) do
    vim.g[k] = v
end

for k, v in pairs(wo) do
    vim.wo[k] = v
end
