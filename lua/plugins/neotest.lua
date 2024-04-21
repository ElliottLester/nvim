return {
    { "nvim-neotest/neotest-plenary" },
    -- { "hfn92/cmake-gtest.nvim", dependencies = { "Civitasv/cmake-tools.nvim" } },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/fixcursorhold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/nvim-nio",
            "alfaix/neotest-gtest",
        },
        opts = { adapters = { "neotest-python", "neotest-gtest" } },
    },
}
