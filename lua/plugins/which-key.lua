local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
}

M.keys = {
  {
    "<leader>a",
    "<cmd>quitall<CR>",
    desc = "Force quit project"
  },
  {
    "<leader>q",
    ":bdelete<CR>",
    desc = "Close current window",
    mode = { "n", "v" }
  },
  {
    "<leader>w",
    function()
      require('bufdelete').bufdelete(0, false)
    end,
    desc = "Close current bufferline",
    mode = { "n", "v" }
  },
  {
    "<leader>?",
    function()
      require("which-key").show({ global = false })
    end,
    desc = "Buffer Local Keymaps (which-key)",
  },
  {
    "<leader>/",
    "<Plug>(comment_toggle_linewise_current)",
    desc = "Comment toggle current line",
    mode = { "n" }
  },
  {
    "<leader>/",
    "<Plug>(comment_toggle_linewise_visual)",
    desc = "Comment toggle linewise (visual)",
    mode = { "v" }
  },
}

return M
