local M = {}

M.keys = {
  {
    "<leader>a",
    "<cmd>quitall<CR>",
    desc = "Force quit project"
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
  {
    "<leader>c",
    "<Cmd>BufferKill<CR>",
    desc = "Close current buffer",
    mode = { "n", "v" }
  }
}

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  keys = M.keys
}
