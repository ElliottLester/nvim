-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<F5>", function()
    require("dap").continue()
end)
vim.keymap.set("n", "<F10>", function()
    require("dap").step_over()
end)
vim.keymap.set("n", "<F11>", function()
    require("dap").step_into()
end)
vim.keymap.set("n", "<F12>", function()
    require("dap").step_out()
end)

local function toggle_diag_buf()
    local bufnr = 0
    local disabled = vim.diagnostic.is_disabled(bufnr)
    if disabled then
        vim.diagnostic.enable(bufnr)
    else
        vim.diagnostic.disable(bufnr)
    end
end

local function toggle_diag_global()
    local disabled = vim.diagnostic.is_disabled()
    if disabled then
        vim.diagnostic.enable()
    else
        vim.diagnostic.disable()
    end
end

vim.keymap.set("n", "<leader>xd", toggle_diag_buf, {
    desc = "Diagnostics: Toggle (Buffer)",
})

vim.keymap.set("n", "<leader>xD", toggle_diag_global, {
    desc = "Diagnostics: Toggle (Global)",
})
