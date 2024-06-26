return {
    -- add more treesitter parsers
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "c",
                "cpp",
                "bash",
                "cmake",
                "html",
                -- "javascript",
                "json",
                "lua",
                "markdown",
                -- "markdown_inline",
                "python",
                -- "query",
                "regex",
                -- "tsx",
                -- "typescript",
                "vim",
                "yaml",
                "zig",
            },
        },
    },
}
