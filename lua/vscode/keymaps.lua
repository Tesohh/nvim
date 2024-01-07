local vscode = require("vscode-neovim")
local vskeymap = function(modes, lhs, cmd)
	vim.keymap.set(modes, lhs, function()
		vscode.action(cmd)
	end)
end
local vskeymapmulti = function(modes, lhs, cmd)
	vim.keymap.set(modes, lhs, function()
		for i, act in ipairs(cmd) do
			vscode.action(cmd)
		end
	end)
end

-- disable arrows in all modes
vim.keymap.set({ "n", "x", "i" }, "<left>", "")
vim.keymap.set({ "n", "x", "i" }, "<down>", "")
vim.keymap.set({ "n", "x", "i" }, "<up>", "")
vim.keymap.set({ "n", "x", "i" }, "<right>", "")

-- lsp keymaps
vskeymap({ "n", "x" }, "]d", "editor.action.marker.next")
vskeymap({ "n", "x" }, "[d", "editor.action.marker.prev")
vskeymap("n", "<leader>ca", "editor.action.quickFix")
vskeymap("n", "<leader>cl", "codelens.showLensesInCurrentLine")
vskeymap("n", "<leader>ra", "editor.action.rename")
vskeymap({ "n", "x" }, "<leader>rr", "rest-client.request")

-- fold support
vskeymap("n", "zM", "editor.foldAll")
vskeymap("n", "zR", "editor.unfoldAll")
vskeymap("n", "zc", "editor.fold")
vskeymap("n", "zC", "editor.foldRecursively")
vskeymap("n", "zo", "editor.unfold")
vskeymap("n", "zO", "editor.unfoldRecursively")
vskeymap("n", "za", "editor.toggleFold")
vskeymap({ "n" }, "j", "cursorDown")
vskeymap({ "n" }, "k", "cursorUp")

-- ui
vskeymap({ "n", "x" }, "<leader>e", "workbench.files.action.focusFilesExplorer")
vskeymap({ "n", "x" }, "<leader>t", "terminal.focus")

-- searching
vskeymap({ "n", "x" }, "-", "vsnetrw.open")
vskeymap({ "n", "x" }, "<leader>f", "workbench.action.quickOpen")
vskeymap({ "n", "x" }, ";", "workbench.action.showEditorsInActiveGroup")
-- vskeymap({'n', 'x'}, '', 'workbench.action.showCommands')
vskeymap({ "n", "x" }, "<leader><leader>", "workbench.action.showCommands")

-- debugging

-- buffer
-- vskeymap({'n','x'}, 'H', "workbench.action.previousEditor")
-- vskeymap({'n','x'}, 'L', "workbench.action.nextEditor")
