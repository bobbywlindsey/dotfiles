return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = { "williamboman/mason.nvim" },

  config = function()
    ensure_installed = { "black", "flake8", "isort", "debugpy" }
  end
}