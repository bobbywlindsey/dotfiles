return {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets"},

    config = function()
        require("blink.cmp").setup({
            keymap = { preset = "default" },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono",
            },
            completion = {
                documentation = {
                    auto_show = true,
                },
            },
            signature = { enabled = true },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
            fuzzy = {
                implementation = "lua",
            },
        })
    end
}
