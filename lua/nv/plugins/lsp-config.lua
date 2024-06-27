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
            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

            vim.lsp.handlers["textDocument/signatureHelp"] =
                vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

            vim.diagnostic.config({
                float = {
                    border = "rounded",
                },
            })

            require("mason-lspconfig").setup({
                ensure_installed = require("nv.masonlist").lsp,
            })
            require("mason-lspconfig").setup_handlers({
                function(server_name) -- default handler (optional)
                    local capabilities = require("cmp_nvim_lsp").default_capabilities()
                    require("lspconfig")[server_name].setup({ capabilities = capabilities })
                end,

                ["lua_ls"] = function()
                    local capabilities = require("cmp_nvim_lsp").default_capabilities()
                    require("lspconfig").lua_ls.setup({
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim", "hs" },
                                },
                                workspace = {
                                    library = {
                                        -- [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                        -- [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                                        ["/Applications/Hammerspoon.app/Contents/Resources/extensions/hs/"] = true,
                                    },
                                },
                            },
                        },
                    })
                end,

                ["gopls"] = function()
                    local capabilities = require("cmp_nvim_lsp").default_capabilities()
                    require("lspconfig").gopls.setup({
                        capabilities = capabilities,
                        settings = {
                            gopls = {
                                completeUnimported = true,
                                analyses = {
                                    unusedparams = true,
                                    nilness = true,
                                    shadow = true,
                                },
                            },
                        },
                    })
                end,

                -- Next, you can provide a dedicated handler for specific servers.
                -- For example, a handler override for the `rust_analyzer`:
                ["rust_analyzer"] = function()
                    local rt = require("rust-tools")
                    rt.setup({
                        server = {
                            settings = {
                                ["rust_analyzer"] = {
                                    cargo = {
                                        allFeatures = true,
                                    },
                                },
                            },
                            on_attach = function(_, bufnr)
                                local o = { buffer = bufnr }
                                vim.keymap.set("n", "K", rt.hover_actions.hover_actions, o)
                                vim.keymap.set("n", "<leader>ca", rt.code_action_group.code_action_group, o)
                            end,
                        },
                    })
                end,
            })
        end,
    },
    {
        "simrat39/rust-tools.nvim",
        ft = { "rust" },
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
                    vim.keymap.set({ "n", "i" }, "<A-i>", vim.lsp.buf.signature_help, opts)
                    vim.keymap.set("n", "<leader>ra", vim.lsp.buf.rename, opts)
                    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                end,
            })
        end,
    },
}
