return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = {
          "prisma",
          "lua",
          "javascript",
          "typescript",
          "html",
          "markdown",
          "markdown_inline",
          "python",
          "vim",
          "yaml",
          "css",
          "go",
          "php",
        },
        highlight = { enable = true },
        indent = { enable = true },
        fold = { enable = true },
      })
    end,
  },

  {
    "anuvyklack/fold-preview.nvim",
    dependencies = "anuvyklack/keymap-amend.nvim",
    config = function()
      require("fold-preview").setup({
        border = "rounded", -- Add a border around the preview
      })
    end,
  }
}
