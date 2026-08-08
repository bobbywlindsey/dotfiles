return {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },

    -- use a release tag to download pre-built binaries
    version = "1.*",

    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
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
    },
    opts_extend = { "sources.default" },
}
