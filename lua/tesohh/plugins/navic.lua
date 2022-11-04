local setup, navic = pcall(require, "nvim-navic")
if not setup then
	return
end

navic.setup({
	highlight = true,
	safe_output = true,
})
