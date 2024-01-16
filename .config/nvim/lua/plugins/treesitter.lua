return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = {"lua","r", "python", "julia", "latex", "bibtex", "csv", "cpp", "gitignore", "html", "markdown", "sql", "toml", "tsv"},
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }
}
