return {
    { "tpope/vim-fugitive", keys = { { "<leader>gs", "<cmd>Git<cr>" } }, cmd = "Git" },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require("gitsigns").setup()
            vim.keymap.set({ "n", "x" }, "<leader>gh", "<cmd>Gitsigns preview_hunk<cr>")
            vim.api.nvim_create_user_command("GitC", function(cmd)
                local msg = ""
                if cmd.args then
                    msg = cmd.args
                else
                    msg = vim.fn.input("commit message > ")
                end

                vim.cmd('!git add .; git commit -m "' .. msg .. '"; git push')
            end, { nargs = 1 })
        end,
    },
}
