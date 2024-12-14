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
      use_default_mappings = false,
      window = {
        mappings = {
          -- Basic navigation and toggling
          ["<cr>"] = "open",               -- Open file or directory
          ["l"] = "open",                  -- Same as <cr>
          ["o"] = "open", -- @NOTE: Should open directory or directory the file is in
          ["h"] = "close_node",            -- Collapse directory
          ["<space>"] = "toggle_node",     -- Expand/collapse directory
          -- ["P"] = function()
          --   -- Toggle the preview
          --   require("neo-tree.sources.filesystem.commands").toggle_preview()
          --
          --   -- Notify the user
          --   vim.notify("Preview toggled", "info", { timeout = 1500, title = "Neo-tree" })
          -- end,

          -- File and directory actions
          ["a"] = "add",                   -- Add a file or directory
          ["d"] = "delete",                -- Delete file or directory
          ["r"] = "rename",                -- Rename file or directory
          ["y"] = "copy_to_clipboard",     -- Copy file to clipboard
          ["x"] = "cut_to_clipboard",      -- Cut file to clipboard
          ["p"] = "paste_from_clipboard",  -- Paste file from clipboard
          ["c"] = "copy",                  -- Copy file or directory
          ["m"] = "move",                  -- Move file or directory

          -- Search and filtering
          -- ["f"] = "filter_on_submit",      -- Filter nodes by name
          -- ["F"] = "clear_filter",          -- Clear filters
          -- ["<C-f>"] = "search",            -- Search within directory
          -- ["<C-r>"] = "refresh",           -- Refresh Neo-tree

          -- File info and diagnostics
          ["i"] = "show_file_details",     -- Show details for selected file
          ["<C-i>"] = "toggle_hidden",     -- Toggle showing hidden files
          ["<leader>gf"] = "scroll_preview", -- Scroll preview

          -- Diagnostics integration
          ["S"] = "open_split",            -- Open file in split
          ["s"] = "open_vsplit",           -- Open file in vertical split
          ["t"] = "open_tabnew",           -- Open file in new tab

          -- Window management
          -- ["R"] = "reveal_in_finder",      -- Reveal file in Finder/Explorer
          ["?"] = "show_help",             -- Show help for mappings
        },
      },
    })
  end,
}
