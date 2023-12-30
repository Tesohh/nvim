return {
    "olexsmir/gopher.nvim",
    ft = { "go", "gomod", "gowork", "gotmpl" },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function ()
        vim.keymap.set('n', '<leader>ge', "<cmd>GoIfErr<cr>", {desc="Go if err"})
    end
}
