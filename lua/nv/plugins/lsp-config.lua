return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = require("nv.masonlist").lsp,
            })
            require("mason-lspconfig").setup_handlers({
                function(server_name) -- default handler (optional)
                    local capabilities = require("cmp_nvim_lsp").default_capabilities()
                    require("lspconfig")[server_name].setup({ capabilities = capabilities })
                end,

                -- Next, you can provide a dedicated handler for specific servers.
                -- For example, a handler override for the `rust_analyzer`:
                --["rust_analyzer"] = function()
                --	require("rust-tools").setup({})
                --end,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf }
                    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
                    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
                    vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
                    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
                    vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                    vim.keymap.set("n", "<leader>ra", vim.lsp.buf.rename, opts)
                    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                end,
            })
        end,
    },
}
