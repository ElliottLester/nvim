return {
    "olimorris/codecompanion.nvim",
    version = "^18.0.0",
    opts = {
        adapters = {
            http = {
                ["llama.cpp"] = function()
                    return require("codecompanion.adapters").extend("openai_compatible", {
                        name = "llama_cpp",
                        formatted_name = "Local llama.cpp",
                        env = {
                            url = "http://llamacpp:5000", -- replace with your llama.cpp instance
                            api_key = "TERM",
                            chat_url = "/v1/chat/completions",
                            models_endpoint = "/v1/models",
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
    config = function(_, opts)
        vim.schedule(function()
            require("codecompanion").setup(opts)
            local wk = require("which-key")

            wk.add({
                {
                    "<leader>a",
                    name = "CodeCompanion",
                    icon = { icon = "🤖", color = "grey" },
                },
                {
                    "<leader>ai",
                    "<cmd>CodeCompanion<cr>",
                    desc = "CodeCompanion Inline",
                    icon = { icon = "", color = "grey" },
                },
                {
                    "<leader>ac",
                    "<cmd>CodeCompanionChat Toggle<cr>",
                    desc = "CodeCompanion Chat",
                    icon = { icon = "💬", color = "grey" },
                },
                {
                    "<leader>aa",
                    "<cmd>CodeCompanionActions<cr>",
                    desc = "CodeCompanion Actions",
                    icon = { icon = "🎬", color = "grey" },
                },
                {
                    "<leader>am",
                    "<cmd>CodeCompanionCmd<cr>",
                    desc = "CodeCompanion Cmd",
                    icon = { icon = ">", color = "grey" },
                },
            })
        end)
    end,
}
