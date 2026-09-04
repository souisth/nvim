vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- locals --

local opt = vim.opt
local key = vim.keymap
local enable = vim.lsp.enable
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

-- keybinds --

key.set("n", "<leader>cd", cmd.Ex, { desc = "dosya gezgini açma tuşu" } )
key.set("n", "<M-;>", ":vnew<CR>", { desc = " yeni dikey pencere açma tuşu" } )
key.set("n", "<M-'>", ":quit<CR>", { desc = "pencereyi kapatma tuşu " } )
key.set("n", "<leader>tt", ":terminal<CR>", { desc = "terminal açma tuşu" } )

-- enable lsp --

enable("pylsp")
enable("lua_ls")
enable("rust_analyzer")

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
