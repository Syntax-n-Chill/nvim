return {
  {
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
        signcolumn = true,         -- Toggle with `:Gitsigns toggle_signs`
        numhl = false,             -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false,            -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false,         -- Toggle with `:Gitsigns toggle_word_diff`
        current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
        },
        current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
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
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  }
}
