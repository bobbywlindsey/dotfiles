local wk = require("which-key")
wk.setup({
    wk.add({
        { "<leader>b", group = "Bullet Journal" },
        { "g", group = "LSP" },
        { "K", desc = "Get documentation" },
    }, { mode = "n" })
})

vim.keymap.set("n", "<leader>?", function()
    require("which-key").show({ global = false })
end, { desc = "Local Keymaps" })

