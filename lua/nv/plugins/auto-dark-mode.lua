return {
    "f-person/auto-dark-mode.nvim",
    config = {
        update_interval = 3000,
        set_dark_mode = function()
            vim.cmd("colorscheme rose-pine")
        end,
        set_light_mode = function()
            vim.cmd("colorscheme rose-pine-dawn")
        end,
    },
}
