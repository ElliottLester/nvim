return {
    "olimorris/codecompanion.nvim",
    enabled = false,
    version = "^18.0.0",
    opts = {
        adapters = {
            http = {
                ["llama.cpp"] = function()
                    return require("codecompanion.adapters").extend("openai_compatible", {
                        name = "llama.cpp",
                        formatted_name = "llama.cpp",
                        env = {
                            url = vim.env.LLAMA_CPP_URL or "http://localhost:5000", -- replace with your llama.cpp instance
                            api_key = "TERM",
                            chat_url = "/v1/chat/completions",
                            models_endpoint = "/v1/models",
                        },
                        handlers = {
                            form_messages = function(self, messages)
                                local system_content = {}
                                local other_messages = {}
                                -- 1. Separate system messages from everything else
                                for _, msg in ipairs(messages) do
                                    if msg.role == "system" then
                                        table.insert(system_content, msg.content)
                                    else
                                        table.insert(other_messages, msg)
                                    end
                                end
                                local final_messages = {}
                                -- 2. If there are system messages, merge them into ONE message at the top
                                if #system_content > 0 then
                                    table.insert(final_messages, {
                                        role = "system",
                                        content = table.concat(system_content, "\n\n"),
                                    })
                                end
                                -- 3. Append all the user/assistant messages
                                for _, msg in ipairs(other_messages) do
                                    table.insert(final_messages, msg)
                                end
                                -- 4. Pass the cleaned messages to the standard OpenAI handler
                                local openai = require("codecompanion.adapters.http.openai")
                                return openai.handlers.form_messages(self, final_messages)
                            end,
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
                        schema = {
                            model = {
                                default = "Qwen3-Coder-Next-IQ4_NL",
                            },
                        },
                    })
                end,
            },
        },
        display = {
            action_palette = {
                width = 95,
                height = 10,
                -- prompt = "Prompt ", -- Prompt used for interactive LLM calls
                -- provider = "default", -- Can be "default", "telescope", "fzf_lua", "mini_pick" or "snacks". If not specified, the plugin will autodetect installed providers.
                opts = {
                    -- show_preset_actions = true, -- Show the preset actions in the action palette?
                    -- show_preset_prompts = true, -- Show the preset prompts in the action palette?
                    title = "CodeCompanion actions", -- The title of the action palette
                },
            },
            chat = {
                window = {
                    opts = {
                        number = false, -- Disable line numbers
                        relativenumber = false, -- Disable relative line numbers
                        spell = true, -- Enable spell checking
                    },
                },
            },
        },
        prompt_library = {
            markdown = {
                dirs = {
                    vim.fn.stdpath("config") .. "/prompts",
                },
            },
        },
        interactions = {
            chat = {
                adapter = "llama.cpp",
                model = "Qwen3-Coder-Next-IQ4_NL",
                tools = {
                    ["file_search"] = { opts = { require_approval_before = false } },
                    ["get_changed_files"] = { opts = { require_approval_before = false } },
                    ["grep_search"] = { opts = { require_approval_before = false } },
                    ["list_code_usages"] = { opts = { require_approval_before = false } },
                    ["memory"] = { opts = { require_approval_before = false } },
                    ["read_file"] = { opts = { require_approval_before = false } },
                    opts = {
                        default_tools = {
                            "file_search",
                            "get_changed_files",
                            "grep_search",
                            "list_code_usages",
                            "memory",
                            "read_file",
                        },
                    },
                },
            },
            -- chat = {
            --     adapter = "anthropic",
            --     model = "claude-sonnet-4.6",
            -- },

            inline = { adapter = "llama.cpp", model = "Qwen3-Coder-Next-IQ4_NL" },
            cmd = { adapter = "llama.cpp", model = "Qwen3-Coder-Next-IQ4_NL" },
            background = { adapter = "llama.cpp", model = "Qwen3-Coder-Next-IQ4_NL" },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "folke/which-key.nvim",
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
