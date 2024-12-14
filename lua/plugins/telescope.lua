return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  config = function()
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = false }

    -- Use vim.keymap.set for Lua functions
    keymap('n', '<C-f>', ':Telescope live_grep<CR>', opts) -- Ctrl + f: Live Grep
    keymap('n', '<leader>f', ':Telescope find_files<CR>', opts) -- <leader> + f: Find Files
  end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        defaults = {
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              -- even more opts
            }),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}

      -- local wk = require("which-key")
      -- wk.add({
      --   { "<C-f>", builtin.find_files, desc = "Find files" },
      --   { "<C-F>", builtin.live_grep, desc = "Live grep" },
      -- }) -- Define mappings for normal mode
