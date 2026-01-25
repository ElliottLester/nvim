return {
    "olimorris/codecompanion.nvim",
    version = "^18.0.0",
    opts = {
        adapters = {
            http = {
                ["llama.cpp"] = function()
                    return require("codecompanion.adapters").extend("openai_compatible", {
                        env = {
                            url = "https://vm.lester.fi:5000", -- replace with your llama.cpp instance
                            api_key = "TERM",
                            chat_url = "/v1/chat/completions",
                        },
                        handlers = {
                            parse_message_meta = function(_, data)
                                local extra = data.extra
                                if extra and extra.reasoning_content then
                                    data.output.reasoning = { content = extra.reasoning_content }
                                    if data.output.content == "" then
                                        data.output.content = nil
                                    end
                                end
                                return data
                            end,
                        },
                    })
                end,
            },
        },
        interactions = {
            chat = { adapter = "llama.cpp" },
            inline = { adapter = "llama.cpp" },
            cmd = { adapter = "llama.cpp" },
            background = { adapter = "llama.cpp" },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
    },
}
