return {
    -- add more treesitter parsers
    {
        "nvim-treesitter/nvim-treesitter",
        commit = "f795520371e6563dac17a0d556f41d70ca86a789",
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
