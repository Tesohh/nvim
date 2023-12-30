return {
    "ThePrimeagen/harpoon",
    event = "VeryLazy",
    branch = "harpoon2",
    dependencies =  {"nvim-lua/plenary.nvim"},
    config = function ()
        local harpoon = require("harpoon")
        harpoon:setup()
        vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<A-a>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<A-s>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<A-d>", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<A-f>", function() harpoon:list():select(4) end)
    end
}
