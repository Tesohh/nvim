return {
    -- ewfijweifjji
    "folke/zen-mode.nvim",
    opts = {
        window = {
            backdrop = 1,
        },
    },
    config = function(_, opts)
        require("zen-mode").setup(opts)
        vim.keymap.set({ "n", "x" }, "<leader>z", "<cmd>ZenMode<cr>")
    end,
}
