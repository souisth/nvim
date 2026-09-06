return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local transparent = require('lualine.themes.auto')
            transparent.normal.c.bg = nil
            transparent.insert.c.bg = nil
            transparent.visual.c.bg = nil
            transparent.replace.c.bg = nil
            transparent.command.c.bg = nil
            transparent.inactive.c.bg = nil
            require('lualine').setup({
                options = {
                    theme = transparent,
                },
            })
            vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
        end,
    },
}
