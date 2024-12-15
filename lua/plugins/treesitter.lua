return {
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
"regex", "bash", "lua"
        },
        highlight = { enable = true },
        indent = { enable = true },
        fold = { enable = true },
      })
    end
}


