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
        wk.register({
            ["<leader>cb"] = { name = "+cmake" },
            ["<leader>cbs"] = { name = "+settings" },
            ["<leader>cbw"] = { name = "+window" },
            ["<leader>cbg"] = { "<cmd>CMakeGenerate<cr>", "Configure" },
            ["<leader>cbb"] = { "<cmd>CMakeQuickBuild<cr>", "Quick Build" },
            ["<leader>cbr"] = { "<cmd>CMakeQuickRun<cr>", "Quick Run" },
            ["<leader>cbd"] = { "<cmd>CMakeQuickDebug<cr>", "Quick Debug" },
            ["<leader>cbB"] = { "<cmd>CMakeBuild<cr>", "Build" },
            ["<leader>cbR"] = { "<cmd>CMakeRun<cr>", "Run" },
            ["<leader>cbD"] = { "<cmd>CMakeDebug<cr>", "Debug" },
            ["<leader>cbt"] = { "<cmd>CMakeRunTest<cr>", "Run ctest" },
            ["<leader>cbc"] = { "<cmd>CMakeClean<cr>", "Clean" },
            ["<leader>cbx"] = { "<cmd>CMakeStopExecutor<cr>", "Stop" },
            -- Settings
            ["<leader>cbsb"] = { "<cmd>CMakeSelectBuildType<cr>", "Select build type" },
            ["<leader>cbst"] = { "<cmd>CMakeSelectBuildTarget<cr>", "Select target" },
            ["<leader>cbsT"] = { "<cmd>CMakeSelectLaunchTarget<cr>", "Select launch target" },
            ["<leader>cbsk"] = { "<cmd>CMakeSelectKit<cr>", "Select kit" },
            ["<leader>cbsC"] = { "<cmd>CMakeSelectConfigurePreset<cr>", "Select Configure Preset" },
            ["<leader>cbsB"] = { "<cmd>CMakeSelectBuildPreset<cr>", "Select build preset" },
            ["<leader>cbsW"] = { "<cmd>CMakeSelectCwd<cr>", "Select a directory, CMakeLists.txt." },
            ["<leader>cbsO"] = { "<cmd>CMakeSelectBuildDir<cr>", "Select build directory" },
            ["<leader>cbss"] = { "<cmd>CMakeSettings<cr>", "Settings" },
            ["<leader>cbsw"] = { "<cmd>CMakeTargetSettings<cr>", "Target settings" },
            -- Windows
            ["<leader>cbwe"] = { "<cmd>CMakeOpenExecutor<cr>", "Open CMake Executor window." },
            ["<leader>cbwr"] = { "<cmd>CMakeCloseExecutor<cr>", "Close CMake Executor window." },
            ["<leader>cbwm"] = { "<cmd>CMakeOpenRunner<cr>", "Open CMake Runner window." },
            ["<leader>cbwo"] = { "<cmd>CMakeCloseRunner<cr>", "Close CMake Runner window." },
            ["<leader>cbwI"] = { "<cmd>CMakeInstall<cr>", "Install CMake targets." },
            ["<leader>cbwf"] = { "<cmd>CMakeShowTargetFiles<cr>", "show target files in telescope." },
        })
    end,
}
