vim.api.nvim_create_user_command("Tms", function(cmd)
    vim.cmd([[silent !tmux neww tmux-sessionizer]])
end, {})
