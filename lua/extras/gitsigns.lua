return {
  "lewis6991/gitsigns.nvim",
  dependencies = { "nvim-lua/plenary.nvim" }, -- Required dependency
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      signcolumn = true,          -- Toggle with `:Gitsigns toggle_signs`
      numhl = false,              -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false,             -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false,          -- Toggle with `:Gitsigns toggle_word_diff`
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "right_align", -- 'eol' | 'overlay' | 'right_align'
        delay = 100,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary> ",
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      sign_priority = 6,
      update_debounce = 200,
      status_formatter = nil, -- Use default
      max_file_length = 40000,
      preview_config = {
        -- Options passed to nvim_open_win
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
    })

    -- Optional Keybindings
    vim.keymap.set("n", "]c", function()
      require("gitsigns").next_hunk()
    end, { desc = "Next Git Hunk" })
    vim.keymap.set("n", "[c", function()
      require("gitsigns").prev_hunk()
    end, { desc = "Previous Git Hunk" })
    vim.keymap.set("n", "<leader>hs", function()
      require("gitsigns").stage_hunk()
    end, { desc = "Stage Hunk" })
    vim.keymap.set("n", "<leader>hr", function()
      require("gitsigns").reset_hunk()
    end, { desc = "Reset Hunk" })
    vim.keymap.set("n", "<leader>hb", function()
      require("gitsigns").blame_line({ full = true })
    end, { desc = "Blame Line" })
    vim.keymap.set("n", "<leader>hp", function()
      require("gitsigns").preview_hunk()
    end, { desc = "Preview Hunk" })


    require('which-key').add({
      {
        "<leader>gb",
        function ()
          local gitsigns = require("gitsigns")
          local current_state = vim.b.gitsigns_blame_line_enabled or false
          vim.b.gitsigns_blame_line_enabled = not current_state
          gitsigns.toggle_current_line_blame()
          if not current_state then
            vim.notify("Git blame enabled", "info", { title = "Gitsigns" })
          else
            vim.notify("Git blame disabled", "info", { title = "Gitsigns" })
          end

        end,
        desc = "Toggle Git Blame",
      },
    })

  end
}
