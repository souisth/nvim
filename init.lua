vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- locals --

local opt = vim.opt
local key = vim.keymap
local enablelsp = vim.lsp.enable
local cmd = vim.cmd

-- options --

opt.number = true
opt.relativenumber = true
opt.ignorecase = true
opt.termguicolors = true
-- opt.cursorline = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab= true
opt.smartindent = true
opt.mouse = ""

-- keybinds --

key.set("n", "<leader>cd", cmd.Ex, { desc = "explorer"} )
key.set("n", "<M-;>", ":vnew<CR>", { desc = "empty vertical window"} )
key.set("n", "<M-'>", ":quit<CR>", { desc = "quit"} )
key.set("n", "<leader>tt", ":term<CR>", { desc = "terminal"} )

-- enable lsp --

enablelsp("pylsp")
enablelsp("lua_ls")
enablelsp("rust_analyzer")

-- require --



-- lazy --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
opt.rtp:prepend(lazypath)
require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    change_detection = { notify = false },
})


