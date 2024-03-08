return {
    "xiyaowong/transparent.nvim",
    opts = {
        extra_groups = {
            "GitSignsAdd",
            "GitSignsChange",
            "GitSignsDelete",
            "FidgetTitle",
            "FidgetTask",
            "DiagnosticSignError",
            "DiagnosticSignWarn",
            "DiagnosticSignHint",
            "DiagnosticSignInfo",
        },
    },
    config = function(_, opts)
        require("transparent").setup(opts)
        vim.cmd("TransparentEnable")
    end,
}
