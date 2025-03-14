return {
    {
        "stevearc/conform.nvim",
        dependencies = { "clangd_extensions.nvim", "mason.nvim" },
        opts = {
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
                -- ["javascript"] = { "prettier" },
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
        },
    },
}
