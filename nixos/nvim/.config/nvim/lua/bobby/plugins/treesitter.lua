return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  build = ":TSUpdate",

  config = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'TSUpdate',
      callback = function()
        require('nvim-treesitter.parsers').latex = {
          install_info = {
            url = 'https://github.com/latex-lsp/tree-sitter-latex',
            generate = true,
          },
        }
      end
    })

    require("nvim-treesitter.configs").setup({
      -- A list of parser names, or "all" (the listed parsers MUST always be installed)
      ensure_installed = { "python", "yaml", "toml", "json", "c", "lua", "query", "markdown", "markdown_inline", "latex" },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      auto_install = true,

      highlight = {
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
    })
  end
}
