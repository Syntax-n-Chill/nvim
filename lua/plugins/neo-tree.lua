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
    })
  end,
}
