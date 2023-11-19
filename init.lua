vim.g.mapleader = ' '
vim.cmd [[language en_US]]

if vim.g.vscode then
    -- VSCode extension
    local vscode = require('vscode-neovim')
    local vskeymap = function (modes, lhs, cmd)
        vim.keymap.set(modes, lhs, function() vscode.action(cmd) end)
    end

    -- use system clipboard but only for yanks
    vim.opt.clipboard = ""
    vim.keymap.set({ "n", "x" }, "y", '"+y')
    vim.keymap.set("n", "p", '""p')

    vskeymap("n", "<leader><leader>", "workbench.action.showCommands")
    vskeymap("n", "<leader>cl", "codelens.showLensesInCurrentLine")
    vskeymap("n", "<leader>ca", "editor.action.quickFix")
    vskeymap("n", "<leader>ff", "workbench.action.quickOpen")
    vskeymap("n", "<tab>", "workbench.action.nextEditor")
    vskeymap("n", "<S-tab>", "workbench.action.previousEditor")
else
    -- ordinary Neovim
end