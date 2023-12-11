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

-- lsp keymaps
vskeymap({'n', 'x'}, "]d", "editor.action.marker.next")
vskeymap({'n', 'x'}, "[d", "editor.action.marker.prev")
vskeymap('n', '<leader>ca', "editor.action.quickFix")
vskeymap('n', '<leader>cl', "codelens.showLensesInCurrentLine")
vskeymap('n', '<leader>n', "codelens.showLensesInCurrentLine")
vskeymap('n', '<leader>ra', "editor.action.rename")

-- fold support
vskeymap('n', 'zM', 'editor.foldAll')
vskeymap('n', 'zR', 'editor.unfoldAll')
vskeymap('n', 'zc', 'editor.fold')
vskeymap('n', 'zC', 'editor.foldRecursively')
vskeymap('n', 'zo', 'editor.unfold')
vskeymap('n', 'zO', 'editor.unfoldRecursively')
vskeymap('n', 'za', 'editor.toggleFold')
vskeymap({'n', 'x'}, 'j', 'cursorDown')
vskeymap({'n', 'x'}, 'k', 'cursorUp')

-- ui
vskeymap({'n', 'x'}, '<leader>e', 'workbench.files.action.focusFilesExplorer')
vskeymap({'n', 'x'}, '<leader>t', 'terminal.focus')

-- searching
vskeymap({'n', 'x'}, '<leader>ff', 'workbench.action.quickOpen')
vskeymap({'n', 'x'}, ';', 'workbench.action.showCommands')
vskeymap({'n', 'x'}, '<leader><leader>', 'workbench.action.showCommands')

-- debugging
