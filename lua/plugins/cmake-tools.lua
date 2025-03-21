return {
    "Civitasv/cmake-tools.nvim",
    lazy = true,
    config = function()
        local opts = {
            cmake_build_directory = "build/${variant:buildType}",
            cmake_build_options = { "-j 20" },
        }
        require("cmake-tools").setup(opts)
        local wk = require("which-key")
        wk.add({
            { "<leader>cb", group = "cmake" },
            { "<leader>cbB", "<cmd>CMakeBuild<cr>", desc = "Build" },
            { "<leader>cbD", "<cmd>CMakeDebug<cr>", desc = "Debug" },
            { "<leader>cbR", "<cmd>CMakeRun<cr>", desc = "Run" },
            { "<leader>cbb", "<cmd>CMakeQuickBuild<cr>", desc = "Quick Build" },
            { "<leader>cbc", "<cmd>CMakeClean<cr>", desc = "Clean" },
            { "<leader>cbd", "<cmd>CMakeQuickDebug<cr>", desc = "Quick Debug" },
            { "<leader>cbg", "<cmd>CMakeGenerate<cr>", desc = "Configure" },
            { "<leader>cbr", "<cmd>CMakeQuickRun<cr>", desc = "Quick Run" },
            { "<leader>cbs", group = "settings" },
            { "<leader>cbsB", "<cmd>CMakeSelectBuildPreset<cr>", desc = "Select build preset" },
            { "<leader>cbsC", "<cmd>CMakeSelectConfigurePreset<cr>", desc = "Select Configure Preset" },
            { "<leader>cbsO", "<cmd>CMakeSelectBuildDir<cr>", desc = "Select build directory" },
            { "<leader>cbsT", "<cmd>CMakeSelectLaunchTarget<cr>", desc = "Select launch target" },
            { "<leader>cbsW", "<cmd>CMakeSelectCwd<cr>", desc = "Select a directory, CMakeLists.txt." },
            { "<leader>cbsb", "<cmd>CMakeSelectBuildType<cr>", desc = "Select build type" },
            { "<leader>cbsk", "<cmd>CMakeSelectKit<cr>", desc = "Select kit" },
            { "<leader>cbss", "<cmd>CMakeSettings<cr>", desc = "Settings" },
            { "<leader>cbst", "<cmd>CMakeSelectBuildTarget<cr>", desc = "Select target" },
            { "<leader>cbsw", "<cmd>CMakeTargetSettings<cr>", desc = "Target settings" },
            { "<leader>cbt", "<cmd>CMakeRunTest<cr>", desc = "Run ctest" },
            { "<leader>cbw", group = "window" },
            { "<leader>cbwI", "<cmd>CMakeInstall<cr>", desc = "Install CMake targets." },
            { "<leader>cbwe", "<cmd>CMakeOpenExecutor<cr>", desc = "Open CMake Executor window." },
            { "<leader>cbwf", "<cmd>CMakeShowTargetFiles<cr>", desc = "show target files in telescope." },
            { "<leader>cbwm", "<cmd>CMakeOpenRunner<cr>", desc = "Open CMake Runner window." },
            { "<leader>cbwo", "<cmd>CMakeCloseRunner<cr>", desc = "Close CMake Runner window." },
            { "<leader>cbwr", "<cmd>CMakeCloseExecutor<cr>", desc = "Close CMake Executor window." },
            { "<leader>cbx", "<cmd>CMakeStopExecutor<cr>", desc = "Stop" },
        })
    end,
}
