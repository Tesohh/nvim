local cat_setup, catppucin = pcall(require, "catppuccin")
if not cat_setup then
	return
end

catppucin.setup({
	flavour = "mocha",
	integrations = {
		dashboard = true,
		ts_rainbow = true,
		navic = {
			enabled = true,
			custom_bg = "NONE",
		},
		indent_blankline = {
			enabled = true,
		},
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
	},
})
vim.api.nvim_command("colorscheme catppuccin")

local function transparent_override()
	local highlights = {
		"Normal",
		"NormalNC",
		"NvimTreeNormal",
		"LineNr",
		"Folded",
		"NonText",
		"SpecialKey",
		"VertSplit",
		"SignColumn",
		"EndOfBuffer",
	}
	for _, name in pairs(highlights) do
		vim.cmd.highlight(name .. " guibg=none ctermbg=none")
	end
end

transparent_override()

-- vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
-- vim.cmd("hi SignColumn guibg=NONE")
