return {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },

    config = function()
        ensure_installed = { "pyright", "lua_ls", "jsonls", "yamlls", "bashls" }
    end
}