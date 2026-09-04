return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "lua",
            "rust",
            "html",
            "css",},
            auto_install = true,
            highlight = {
                enable = true,
            },
        },
    }
