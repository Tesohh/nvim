return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            vim.keymap.set({ "n", "x" }, "<leader>f", "<cmd>Telescope find_files theme=dropdown<cr>")
            vim.keymap.set({ "n", "x" }, "<leader>sw", "<cmd>Telescope live_grep<cr>")
            vim.keymap.set({ "n", "x" }, "<leader>gc", "<cmd>Telescope git_commits<cr>")
            vim.keymap.set({ "n", "x" }, "<leader>gs", "<cmd>Telescope git_status<cr>")
            vim.keymap.set({ "n", "x" }, "<leader>ss", "<cmd>Telescope lsp_document_symbols theme=ivy<cr>")
            vim.keymap.set({ "n", "x" }, "<leader>sS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>")
            vim.keymap.set({ "n", "x" }, "<leader>se", "<cmd>Telescope symbols theme=ivy<cr>")
            vim.keymap.set({ "n", "x" }, ";", "<cmd>Telescope buffers theme=dropdown<cr>")
        end,
    },
    {
        "nvim-telescope/telescope-symbols.nvim",
    },
}
