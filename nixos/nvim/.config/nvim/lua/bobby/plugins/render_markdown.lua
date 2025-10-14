return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},

    config = function()
        require("render-markdown").setup({
            -- https://github.com/MeanderingProgrammer/render-markdown.nvim/wiki/Checkboxes#icons
            -- https://www.nerdfonts.com/cheat-sheet
            checkbox = {
                enabled = true,
                render_modes = false,
                bullet = false,
                right_pad = 1,
                unchecked = {
                    icon = " ",
                    highlight = "RenderMarkdownTodo",
                    scope_highlight = nil,
                },
                checked = {
                    icon = "󰱒 ",
                    highlight = "RenderMarkdownTodo",
                    scope_highlight = "@markup.strikethrough"
                },
                custom = {
                    irrelevant = {
                        raw = "[s]",
                        rendered = " ",
                        highlight = "RenderMarkdownTodo",
                        scope_highlight = "@markup.strikethrough"
                    },
                    delegated = {
                        raw = "[/]",
                        rendered = " ",
                        highlight = "RenderMarkdownTodo",
                        scope_highlight = nil
                    },
                    migrated = {
                        raw = "[>]",
                        rendered = " ",
                        highlight = "RenderMarkdownTodo",
                        scope_highlight = nil
                    },
                    event = {
                        raw = "[o]",
                        rendered = " ",
                        highlight = "RenderMarkdownTodo",
                        scope_highlight = nil
                    },
                    note = {
                        raw = "[-]",
                        rendered = " ",
                        highlight = "RenderMarkdownTodo",
                        scope_highlight = nil
                    },
                    feeling = {
                        raw = "[=]",
                        rendered = " ",
                        highlight = "RenderMarkdownTodo",
                        scope_highlight = nil
                    },
                    quote = {
                        raw = '["]',
                        rendered = " ",
                        highlight = "RenderMarkdownTodo",
                        scope_highlight = nil
                    },
                    insight = {
                        raw = "[!]",
                        rendered = " ",
                        highlight = "RenderMarkdownTodo",
                        scope_highlight = nil
                    },
                },
            },
            callout = {
                success = {
                    raw = "[!story]",
                    rendered = " ",
                    highlight = "RenderMarkdownQuote",
                },
                intentions = {
                    raw = "[!intentions]",
                    rendered = "󰆋 ",
                    highlight = "RenderMarkdownQuote",
                },
            }
        })
    end
}