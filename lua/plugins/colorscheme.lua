return
{
    'sainnhe/everforest',
    lazy = false,
    priority = 1000,
    config = function()
        vim.g.everforest_disable_terminal_colours = true
        vim.g.everforest_transparent_background = 1
        vim.g.everforest_enable_italic = true
        vim.g.everforest_background = 'medium'
        vim.g.everforest_better_performance = 1
        vim.cmd.colorscheme('everforest')
    end
}
