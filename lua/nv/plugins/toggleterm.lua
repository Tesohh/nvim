return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup()
        vim.keymap.set({ "n", "x", "i", "t" }, "<F7>", "<cmd>ToggleTerm direction=float<cr>")
        vim.keymap.set({ "n", "x", "i", "t" }, "<F8>", "<cmd>ToggleTerm direction=horizontal<cr>")
    end,
}
