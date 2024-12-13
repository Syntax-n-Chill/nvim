local M = {}

local harpoon = require("harpoon")

M.keys = {
  {
    "<leader>e",
    ":Neotree filesystem toggle left<CR>",
    desc = "Toggle open/close Neotree",
  },
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
    "<leader>y",
    function()
      local file_name = vim.fn.expand('%:t')
      require("notify")("Added " .. file_name, "info", { timeout = 1500, title = "Harpoon'd yo ass" })
      harpoon:list():add()
    end,
    silent = true,
    desc = "Add Harpoon mark",
  },
  {
    "<C-e>",
    function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end,
    silent = true,
    desc = "Toggle Harpoon menu",
  },
  {
    "<leader>n",
    function()
      harpoon:list().clear()
    end,
    silent = true,
    desc = "Clear Harpoon list",
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
  }
}

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  keys = M.keys
}
