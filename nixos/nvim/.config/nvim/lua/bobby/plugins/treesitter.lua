return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",

  config = function()
    -- Custom parser registration (same syntax as before)
    vim.api.nvim_create_autocmd("User", {
      pattern = "TSUpdate",
      callback = function()
        require("nvim-treesitter.parsers").gitignore.install_info.branch = "main"
        require("nvim-treesitter.parsers").latex = {
          install_info = {
            url = "https://github.com/latex-lsp/tree-sitter-latex",
            branch = "master",
            generate = true,
          },
        }
      end,
    })

    require("nvim-treesitter").setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    -- Install/ensure parsers (replaces `ensure_installed`)
    require("nvim-treesitter").install({
      "python", "yaml", "toml", "json", "c", "lua",
      "query", "markdown", "markdown_inline", "latex",
    })

    -- Enable highlighting (replaces `highlight.enable = true`)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "python", "yaml", "toml", "json", "c", "lua", "query", "markdown", "tex" },
      callback = function() vim.treesitter.start() end,
    })
  end,
}
