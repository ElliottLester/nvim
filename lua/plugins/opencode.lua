return {
    "nickjvandyke/opencode.nvim",
    enabled = false,
    version = "*", -- Latest stable release
    dependencies = {
        {
            -- `snacks.nvim` integration is recommended, but optional
            ---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
            "folke/snacks.nvim",
            optional = false,
            opts = {
                input = {}, -- Enhances `ask()`
                picker = { -- Enhances `select()`
                    actions = {
                        opencode_send = function(...)
                            return require("opencode").snacks_picker_send(...)
                        end,
                    },
                    win = {
                        input = {
                            keys = {
                                ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
                            },
                        },
                    },
                },
            },
        },
    },
    config = function()
        ---@type opencode.Opts
        vim.g.opencode_opts = {
            -- Your configuration, if any; goto definition on the type or field for details
        }
        local wk = require("which-key")

        vim.o.autoread = true -- Required for `opts.events.reload`

        -- Recommended/example keymaps
        wk.add({
            {
                "<leader>a",
                name = "opencode",
                icon = { icon = "🤖", color = "grey" },
            },
            {
                "<leader>aa",
                function()
                    require("opencode").ask("@this: ", { submit = true })
                end,
                desc = "Ask opencode…",
                mode = { "n", "x" },
                icon = { icon = "💬", color = "grey" },
            },
            {
                "<leader>ae",
                function()
                    require("opencode").select()
                end,
                desc = "Execute opencode action…",
                mode = { "n", "x" },
                icon = { icon = "🎬", color = "grey" },
            },
            {
                "<C-c>",
                function()
                    require("opencode").toggle()
                end,
                desc = "Toggle opencode",
                mode = { "n", "t" },
                icon = { icon = "⚙️", color = "grey" },
            },
            {
                "<leader>at",
                function()
                    require("opencode").toggle()
                end,
                desc = "Toggle opencode",
                mode = { "n", "t" },
                icon = { icon = "⚙️", color = "grey" },
            },
            {
                "go",
                function()
                    return require("opencode").operator("@this ")
                end,
                desc = "Add range to opencode",
                mode = "x",
                expr = true,
            },
            {
                "goo",
                function()
                    return require("opencode").operator("@this ") .. "_"
                end,
                desc = "Add line to opencode",
                mode = "x",
                expr = true,
            },
            {
                "<leader>au",
                function()
                    require("opencode").command("session.half.page.up")
                end,
                desc = "Scroll opencode up",
                mode = "n",
            },
            {
                "<leader>ad",
                function()
                    require("opencode").command("session.half.page.down")
                end,
                desc = "Scroll opencode down",
                mode = "n",
            },
        })
        local opencode_cmd = "opencode --port"
        ---@type snacks.terminal.Opts
        local snacks_terminal_opts = {
            win = {
                position = "right",
                width = 0.5,
                enter = false,
                on_win = function(win)
                    -- Set up keymaps and cleanup for an arbitrary terminal
                    require("opencode.terminal").setup(win.win)
                end,
            },
        }
        ---@type opencode.Opts
        vim.g.opencode_opts = {
            server = {
                start = function()
                    require("snacks.terminal").open(opencode_cmd, snacks_terminal_opts)
                end,
                stop = function()
                    require("snacks.terminal").get(opencode_cmd, snacks_terminal_opts):close()
                end,
                toggle = function()
                    require("snacks.terminal").toggle(opencode_cmd, snacks_terminal_opts)
                end,
            },
        }
    end,
}
