local icons = require('user.icons')

local M = {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  preview_state = false, -- Global variable to track preview state
  neotree_state = nil,
  notify_id = nil,
}

local preview_toggle_notify = function()
  return vim.notify("(Press 'P' to toggle off)", 'info', {
    title = 'PREVIEW MODE ON',
    render = 'wrapped-compact', -- Compact style for smaller notifications
    min_width = 10, -- Smaller width for compact display
    max_width = 20, -- Smaller width for compact display
    icon = '🍝',
    timeout = false,
    top_down = false, -- Positions notifications from bottom to top
    animate = false,
    -- timeout = M.preview_state and false or 1500, -- Sticky when ON, timeout when OFF
  })
end

local dismiss_toggle_notify = function()
  -- Clear previous notification if any
  if M.notify_id then
    local notify = require('notify')
    notify.dismiss({ id = M.notify_id })
    M.notify_id = nil
  end
end

M.config = function()
  require('which-key').add({
    {
      '<leader>e',
      ':Neotree filesystem toggle left<CR>',
      desc = 'Toggle open/close Neo-tree',
    },
  })

  local toggle_preview_state = function(state)
    local commands = require('neo-tree.sources.filesystem.commands')

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
  end

  local mappings = {
    -- Basic navigation and toggling
    ['<cr>'] = 'open', -- Open file or directory
    ['l'] = 'open', -- Same as <cr>
    ['o'] = 'open', -- @NOTE: Should open directory or directory the file is in
    ['<2-LeftMouse>'] = 'open', -- Left-click to open a file or expand/collapse a directory
    ['<2-RightMouse>'] = 'close_node', -- Right-click to collapse a directory
    ['h'] = 'close_node', -- Collapse directory
    ['<space>'] = 'toggle_node', -- Expand/collapse directory
    ['H'] = 'toggle_hidden', -- Toggle hidden files
    ['P'] = toggle_preview_state,
    -- File and directory actions
    ['a'] = 'add', -- Add a file or directory
    ['d'] = 'delete', -- Delete file or directory
    ['r'] = 'rename', -- Rename file or directory
    ['y'] = 'copy_to_clipboard', -- Copy file to clipboard
    ['x'] = 'cut_to_clipboard', -- Cut file to clipboard
    ['p'] = 'paste_from_clipboard', -- Paste file from clipboard
    ['c'] = 'copy', -- Copy file or directory
    ['Y'] = 'copy_file_path_to_clipboard',
    ['m'] = 'move', -- Move file or directory

    -- Search and filtering
    -- ["f"] = "filter_on_submit",      -- Filter nodes by name
    -- ["F"] = "clear_filter",          -- Clear filters
    -- ["<C-f>"] = "search",            -- Search within directory
    -- ["<C-r>"] = "refresh",           -- Refresh Neo-tree

    -- File info and diagnostics
    ['i'] = 'show_file_details', -- Show details for selected file
    ['<C-i>'] = 'toggle_hidden', -- Toggle showing hidden files
    ['<leader>gf'] = 'scroll_preview', -- Scroll preview

    -- Diagnostics integration
    ['S'] = 'open_split', -- Open file in split
    ['s'] = 'open_vsplit', -- Open file in vertical split
    ['t'] = 'open_tabnew', -- Open file in new tab

    -- Window management
    -- ["R"] = "reveal_in_finder",      -- Reveal file in Finder/Explorer
    ['?'] = 'show_help', -- Show help for mapping
  }

  local user_commands = {
    copy_file_path_to_clipboard = function(state)
      -- Make sure we have a tree and a node
      local tree = state.tree
      if not tree then
        vim.notify('No tree found in this state.', vim.log.levels.ERROR)
        return
      end

      local node = tree:get_node()
      if not node then
        vim.notify('No node selected.', vim.log.levels.ERROR)
        return
      end

      -- node.path is usually the absolute path
      local path = node.path
      if not path then
        vim.notify('Selected node has no path.', vim.log.levels.ERROR)
        return
      end

      -- Copy to the + register (system clipboard on most OS)
      vim.fn.setreg('+', path)
      vim.notify('Copied path to clipboard: ' .. path)
    end,
  }

  vim.api.nvim_create_autocmd('BufEnter', {
    pattern = { 'neo-tree*', '!neo-tree.lua' },
    callback = function()
      if M.preview_state and not M.notify_id then
        local commands = require('neo-tree.sources.filesystem.commands')
        commands.toggle_preview(M.neotree_state)

        M.notify_id = preview_toggle_notify()
      end
    end,
  })

  vim.api.nvim_create_autocmd('BufLeave', {
    pattern = { 'neo-tree*', '!neo-tree.lua' },
    callback = function()
      if M.notify_id then
        dismiss_toggle_notify()
      end
    end,
  })

  require('neo-tree').setup({
    filesystem = {
      follow_current_file = { enabled = true },
      hijack_netrw = true,
      use_libuv_file_watcher = true,
      filtered_items = {
        visible = false, -- Ensure hidden files can be toggled visible
        hide_dotfiles = false, -- Do not hide dotfiles
        hide_gitignored = true, -- Hide files ignored by .gitignore
        hide_by_name = { '.git' }, -- Always hide the .git folder
        always_show = {}, -- Leave this empty to allow .gitignore rules to apply
        never_show = {}, -- No additional exclusions
        never_show_by_pattern = {}, -- No patterns to exclude
      },
    },
    default_component_configs = {
      indent = {
        expander_collapsed = '',
        expander_expanded = '',
        expander_highlight = 'NeoTreeExpander',
      },
      git_status = {
        show_untracked = true,
        show_ignored = false, -- Do not show gitignored files
        show_unstaged = true,
        show_staged = true,
        symbols = {
          added = icons.git.LineAdded,
          modified = icons.git.LineModified,
          deleted = icons.git.LineRemoved,
          renamed = icons.git.FileRenamed,
          untracked = icons.git.FileUntracked,
          ignored = icons.git.FileIgnored,
          unstaged = icons.git.FileUnstaged,
          staged = icons.git.FileStaged,
          conflict = icons.git.FileUnmerged,
        },
      },
    },
    buffers = {
      follow_current_file = { enabled = true },
    },
    use_default_mappings = false,
    commands = user_commands,
    window = {
      mappings = mappings,
    },
  })
end

return M
