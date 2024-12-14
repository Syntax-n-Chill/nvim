return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require('which-key').add({
      "<leader>e",
      ":Neotree filesystem toggle left<CR>",
      desc = "Toggle open/close Neotree",
    })


    require('neo-tree').setup({
      filesystem = {
        follow_current_file = { enabled = true }, -- Automatically highlight the current file
        hijack_netrw = true,        -- Replace netrw with Neo-tree
        use_libuv_file_watcher = true, -- Automatically update Neo-tree when files change
      },
      buffers = {
        follow_current_file = { enabled = true }, -- Highlight the file in the Buffers source
      },
      window = {
        mappings = {
          ["<leader>gf"] = "scroll_preview",
          ["h"] = "close_node", -- Collapse directories
          ["l"] = "open",       -- Open a file or expand a directory
          ["<space>"] = "toggle_node", -- Optional: Toggle node expansion
          ["<cr>"] = "open",    -- Open a file or directory (redundant with 'l')
          ["<esc>"] = "close_window", -- Close the Neo-tree window
        },
      },
    })
  end,
}
