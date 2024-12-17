return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local wk = require('which-key')
      wk.add({
        { '<C-f>', ':Telescope live_grep<CR>', desc = 'Telescope live grep', icon = '🔭' },
        { '<leader>F', ':Telescope live_grep<CR>', desc = 'Telescope live grep', icon = '🔭' },
        { '<leader>f', ':Telescope find_files<CR>', desc = 'Telescope find files', icon = '🔭' },
        { '<leader>r', ':Telescope oldfiles<CR>', desc = 'Telescope recent files', icon = '🔭' },
      }) -- Define mappings for normal mode
    end,
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require('telescope').setup({
        defaults = {
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown({
              -- even more opts
            }),
          },
        },
      })
      require('telescope').load_extension('ui-select')
    end,
  },
}
