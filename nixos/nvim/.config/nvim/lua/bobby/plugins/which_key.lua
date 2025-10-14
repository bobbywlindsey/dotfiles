return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },

    config = function()
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
    end
}