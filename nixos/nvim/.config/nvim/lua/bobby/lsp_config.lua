local capabilities = require("blink.cmp").get_lsp_capabilities()

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

--vim.lsp.config("pylsp", {})
vim.lsp.config("lua_ls", {
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
vim.lsp.config("pyright", {
    capabilities = capabilities,
    on_attach = on_attach
})
