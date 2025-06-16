require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = { "pyright", "lua_ls", "jsonls",
    "yamlls", "bashls" },
})

require("mason-tool-installer").setup({
    ensure_installed = { "black", "flake8", "isort", "debugpy" }
})

local lspconfig = require("lspconfig")
local capabilities = require("blink.cmp").get_lsp_capabilities()

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

local on_attach = function(_,_)
    -- :h lsp    (for default keybindings and APIs)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation,
        { desc = "Get implementation" })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition,
        { desc = "Get definition" })
    vim.keymap.set("n", "gca", vim.lsp.buf.code_action,
        { desc = "Get code action" })
    vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references,
        { desc = "Get references" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover,
        { desc = "Get documentation" })
end

--lspconfig.pylsp.setup {}
lspconfig.lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})
lspconfig.pyright.setup({
    capabilities = capabilities,
    on_attach = on_attach
})
