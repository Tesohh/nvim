return {
    "xiyaowong/transparent.nvim",
    opts = {
        extra_groups = {
            "GitSignsAdd",
            "GitSignsChange",
            "GitSignsDelete",
        },
    },
    config = function(_, opts)
        require("transparent").setup(opts)
        vim.cmd("TransparentEnable")
    end,
}
