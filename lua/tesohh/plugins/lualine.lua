local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local lualine_gruvbox = require("lualine.themes.gruvbox")


lualine.setup({
	options = {
		theme = lualine_gruvbox
	}
})
