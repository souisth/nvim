
return {
    {
        "mason-org/mason.nvim",
        opts = {        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            },},},},
            {
                "neovim/nvim-lspconfig",
                config = function()
                vim.lsp.config("lua_ls", {
                    settings = {
                        Lua = {
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true),
                            }
                        }
                    }
                })
            end,

            },
            {
                "mason-org/mason-lspconfig.nvim",
                opts = {
                    ensure_installed = {
                        "lua_ls",
                        "rust_analyzer",
                    }},
                    dependencies = {
                        { "mason-org/mason.nvim", opts = {} },
                        "neovim/nvim-lspconfig",
                    },
                },
            }
