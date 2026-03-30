return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local install = require("nvim-treesitter.install")
      install.prefer_git = true

      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = { "r", "latex", "markdown", "rnoweb", "yaml" },
        auto_install = false,
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }
}
