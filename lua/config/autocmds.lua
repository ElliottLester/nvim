-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.g.clipboard = {
    name = "OSC 52",
    -- copy = {
    --     ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    --     ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    -- },
    copy = {
        ["+"] = { "tmux", "load-buffer", "-" },
        ["*"] = { "tmux", "load-buffer", "-" },
    },
    paste = {
        ["+"] = { "tmux", "save-buffer", "-" },
        ["*"] = { "tmux", "save-buffer", "-" },
        -- paste = {
        --   ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
        --   ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
    },
}
