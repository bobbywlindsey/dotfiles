return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = { "pyright", "lua_ls", "jsonls", "yamlls", "bashls" },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
