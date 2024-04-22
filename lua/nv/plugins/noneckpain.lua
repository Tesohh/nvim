return {
    "shortcuts/no-neck-pain.nvim",
    opts = {
        autocmds = {
            enableOnVimEnter = true,
        },
        buffers = {
            wo = {
                fillchars = "eob: ",
            },
            bo = {
                filetype = "md",
            },
        },
    },
}
