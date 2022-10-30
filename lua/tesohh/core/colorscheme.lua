local status, _ = pcall(vim.cmd, "colorscheme tokyonight-storm")
if not status then
	print("Colorscheme not found")
	return
end

-- vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
-- vim.cmd("hi SignColumn guibg=NONE")
