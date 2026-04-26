return {
    { "nvim-neotest/neotest-plenary" },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "antoinemadec/fixcursorhold.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-neotest/nvim-nio",
            "nvim-treesitter/nvim-treesitter",
            {
                "orjangj/neotest-ctest",
                opts = { dap_adapter = "codelldb" },
            },
        },
        opts = function()
            return {
                adapters = {
                    "neotest-python",
                    "neotest-ctest",
                },
            }
        end,
    },
}
