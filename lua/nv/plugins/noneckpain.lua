return {
	"shortcuts/no-neck-pain.nvim",
	opts = {
		autocmds = {
			enableOnVimEnter = true,
		},
		buffers = {
			wo = {
				fillchars = "eob: ",
			},
			bo = {
				filetype = "md",
			},
			right = {
				scratchPad = {
					enabled = false,
					pathToFile = "TODO.md",
				},
			},
			left = {
				scratchPad = {
					enabled = false,
					pathToFile = "NOTES.md",
				},
			},
		},
	},
	config = function(_, opts)
		require("no-neck-pain").setup(opts)
		vim.keymap.set("n", "<leader>ns", "<cmd>NoNeckPainScratchPad<CR>")
	end,
}
