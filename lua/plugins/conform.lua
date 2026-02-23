return {
    {
        "stevearc/conform.nvim",
        dependencies = { "clangd_extensions.nvim", "mason.nvim" },
        opts = {
            notify_on_error = true,
            format_on_save = function(bufnr)
                -- Disable "format_on_save lsp_fallback" for languages that don't
                -- have a well standardized coding style. You can add additional
                -- languages here or re-enable it for the disabled ones.
                local disable_filetypes = { c = true, cpp = true }
                return {
                    timeout_ms = 500,
                    lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
                }
            end,
            formatters_by_ft = {
                ["c"] = { "clang_format" },
                ["cpp"] = { "clang_format" },
                ["objc"] = { "clang_format" },
                ["objcpp"] = { "clang_format" },
                ["cuda"] = { "clang_format" },
                ["proto"] = { "clang_format" },
                ["lua"] = { "stylua" },
                ["rust"] = { "rustfmt" },
                -- ["fish"] = { "fish_indent" },
                ["sh"] = { "shfmt" },
                ["python"] = { "black" },
                ["javascript"] = { "prettier" },
                -- ["javascriptreact"] = { "prettier" },
                -- ["typescript"] = { "prettier" },
                -- ["typescriptreact"] = { "prettier" },
                -- ["vue"] = { "prettier" },
                -- ["css"] = { "prettier" },
                -- ["scss"] = { "prettier" },
                -- ["less"] = { "prettier" },
                ["html"] = { "prettier" },
                ["json"] = { "prettier" },
                ["jsonc"] = { "prettier" },
                ["yaml"] = { "prettier" },
                ["markdown"] = { "prettier" },
                -- ["markdown.mdx"] = { "prettier" },
                -- ["graphql"] = { "prettier" },
                -- ["handlebars"] = { "prettier" },
            },
            formatters = {
                clang_format = {
                    prepend_args = { "--style=file", "--fallback-style=Microsoft" },
                },
            },
        },
    },
}
