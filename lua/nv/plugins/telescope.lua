return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            pickers = {
                find_files = {
                    theme = "dropdown",
                },
            },
        },
        config = function(_, opts)
            require("telescope").setup(opts)

            vim.keymap.set({ "n", "x" }, "<leader>f", function()
                require("telescope.builtin").find_files({
                    hidden = true,
                    theme = "dropdown",
                    file_ignore_patterns = { "node_modules", ".git", "*.png", "*.wav", "*.mp3", "*.o", "*.ttf" },
                })
            end)
            vim.keymap.set({ "n", "x" }, "<leader>sf", "<cmd>Telescope git_files theme=dropdown<cr>")
            -- vim.keymap.set({ "n", "x" }, ";", "<cmd>Telescope buffers theme=dropdown<cr>")
            vim.keymap.set({ "n", "x" }, "<leader>sw", "<cmd>Telescope live_grep<cr>")
            vim.keymap.set({ "n", "x" }, "<leader>ss", "<cmd>Telescope lsp_document_symbols theme=ivy<cr>")
            vim.keymap.set({ "n", "x" }, "<leader>sS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>")
            vim.keymap.set({ "n", "x" }, "<leader>se", "<cmd>Telescope symbols theme=ivy<cr>")
            vim.keymap.set({ "n", "x" }, "<leader>sf", "<cmd>Telescope find_files theme=dropdown<cr>")
            vim.keymap.set({ "n", "x" }, "<leader>gc", "<cmd>Telescope git_commits<cr>")
            -- vim.keymap.set({ "n", "x" }, "<leader>gs", "<cmd>Telescope git_status<cr>")
        end,
    },
    {
        "nvim-telescope/telescope-symbols.nvim",
    },
}
