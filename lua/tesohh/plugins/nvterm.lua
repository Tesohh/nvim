local setup, nvterm = pcall(require, "nvterm")
if not setup then
	return
end

nvterm.setup({})
