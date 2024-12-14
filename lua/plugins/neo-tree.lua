local M = {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  preview_state = false, -- Global variable to track preview state
  neotree_state = nil,
  notify_id = nil,
}

local preview_toggle_notify = function()
  return vim.notify(
    "(Press 'P' to toggle off)",
    "info",
    {
      title = "PREVIEW MODE ON",
      render = "wrapped-compact", -- Compact style for smaller notifications
      min_width = 10,     -- Smaller width for compact display
      max_width = 20,     -- Smaller width for compact display
      icon = "🍝",
      timeout = false,
      top_down = false,             -- Positions notifications from bottom to top
      animate = false,
      -- timeout = M.preview_state and false or 1500, -- Sticky when ON, timeout when OFF
    }
  )
end

local dismiss_toggle_notify = function()
  -- Clear previous notification if any
  if M.notify_id then
    require("notify").dismiss({ id = M.notify_id })
    M.notify_id = nil
  end
end

M.config = function()
  require('which-key').add({
    {
      "<leader>e",
      ":Neotree filesystem toggle left<CR>",
      desc = "Toggle open/close Neo-tree",
    },
  })

  local mappings = {
    -- Basic navigation and toggling
    ["<cr>"] = "open",               -- Open file or directory
    ["l"] = "open",                  -- Same as <cr>
    ["o"] = "open", -- @NOTE: Should open directory or directory the file is in
    ["<2-LeftMouse>"] = "open", -- Left-click to open a file or expand/collapse a directory
    ["<2-RightMouse>"] = "close_node", -- Right-click to collapse a directory
    ["h"] = "close_node",            -- Collapse directory
    ["<space>"] = "toggle_node",     -- Expand/collapse directory
    ["H"] = "toggle_hidden", -- Toggle hidden files
    ["P"] = function(state)
      local commands = require("neo-tree.sources.filesystem.commands")

      -- Toggle preview and update state
      M.preview_state = not M.preview_state
      commands.toggle_preview(state)
      M.neotree_state = state

      -- Clear previous notification if any
      if not M.preview_state then
        dismiss_toggle_notify()
      end

      if M.preview_state then
        M.notify_id = preview_toggle_notify()
      end
    end,
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
    ["?"] = "show_help",             -- Show help for mapping
  }

  vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "neo-tree*", "!neo-tree.lua" },
    callback = function()
      if M.preview_state and not M.notify_id then
        local commands = require("neo-tree.sources.filesystem.commands")
        commands.toggle_preview(M.neotree_state)

        M.notify_id = preview_toggle_notify()
      end
    end,
  })

  vim.api.nvim_create_autocmd("BufLeave", {
    pattern = { "neo-tree*", "!neo-tree.lua" },
    callback = function()
      if M.notify_id then
        dismiss_toggle_notify()
      end
    end,
  })

  require('neo-tree').setup({
    default_component_configs = {
      indent = {
        expander_collapsed = "", -- Icon for collapsed directories
        expander_expanded = "", -- Icon for expanded directories
        expander_highlight = "NeoTreeExpander", -- Highlight group for the icons
      }
    },
    filesystem = {
      follow_current_file = { enabled = true },
      hijack_netrw = true,
      use_libuv_file_watcher = true,
    },
    buffers = {
      follow_current_file = { enabled = true },
    },
    use_default_mappings = false,
    window = {
      mappings = mappings,
    },
  })
end

return M
