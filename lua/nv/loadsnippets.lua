function autoload_vscode_snippets()
	local cwd = vim.fn.getcwd()
	local vscode_snippets_path = cwd .. "/.vscode"

	if vim.fn.isdirectory(vscode_snippets_path) == 1 then
		require("luasnip/loaders/from_vscode").load_standalone({ path = vscode_snippets_path })
	end
end

function autoload_vscode_snippets2()
	-- Imposta il percorso della cartella degli snippet di VSCode
	local cwd = vim.fn.getcwd()
	local vscode_snippets_path = cwd .. "/.vscode"

	-- Verifica se la cartella .vscode esiste nella directory corrente
	if vim.fn.isdirectory(vscode_snippets_path) == 1 then
		-- Carica gli snippet di VSCode in LuaSnip utilizzando load_standalone
		require("luasnip/loaders/from_vscode").load_standalone({
			paths = { vscode_snippets_path },
			include = { "*.json" },
		})
	else
		print("La cartella .vscode non esiste nella directory corrente.")
	end
end

-- vim.cmd("autocmd BufEnter * lua autoload_vscode_snippets()")
