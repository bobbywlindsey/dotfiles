return {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
      { "folke/lazydev.nvim", ft = "lua", opts = { library = { path = "${3rd}/luv/library", words = { "vim%.uv" } } } },
    },
}