return {
  -- {
  --   'kevinhwang91/nvim-ufo',
  --   requires = 'kevinhwang91/promise-async',
  --   provider_selector = function()
  --     return { "treesitter", "indent" }
  --   end
  -- },
  {
    "chrisgrieser/nvim-origami",
    event = "VeryLazy",
    opts = {}, -- needed even when using default config
  },
  {
    "hedyhli/outline.nvim",
    config = function()
      vim.keymap.set("n", "<C-o>", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
      require("outline").setup()
    end
  },
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
}
