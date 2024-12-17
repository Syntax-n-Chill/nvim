local M = {
  'folke/which-key.nvim',
  event = 'VeryLazy',
}

M.opts = {
  preset = 'helix',
  win = {
    border = 'rounded',
    no_overlap = false,
    padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
    title = false,
    title_pos = 'center',
    zindex = 1000,
    bo = {},
    wo = {},
  },
  sort_by_description = true,
  sort = { 'alphanumerical' },
}

M.keys = {
  {
    '<leader>a',
    '<cmd>quitall<CR>',
    desc = 'Force quit project',
  },
  {
    '<leader>A',
    '<cmd>quitall!<CR>',
    desc = 'Force quit project',
  },
  {
    '<leader>q',
    ':q<CR>',
    -- ":bdelete<CR>",
    desc = 'Close current window',
    mode = { 'n', 'v' },
  },
  {
    '<leader>w',
    function()
      require('bufdelete').bufdelete(0, false)
    end,
    desc = 'Close current bufferline',
    mode = { 'n', 'v' },
  },
  {
    '<leader>?',
    function()
      require('which-key').show({ global = false })
    end,
    desc = 'Buffer Local Keymaps (which-key)',
  },
  {
    '<leader>/',
    '<Plug>(comment_toggle_linewise_current)',
    desc = 'Comment toggle current line',
    mode = { 'n' },
  },
  {
    '<leader>/',
    '<Plug>(comment_toggle_linewise_visual)',
    desc = 'Comment toggle linewise (visual)',
    mode = { 'v' },
  },
}

return M
