local M = {
  'ggandor/leap.nvim',
  dependencies = { 'tpope/vim-repeat' },
}

M.config = function()
  local leap = require('leap')
  leap.create_default_mappings()

  -- Define equivalence classes for brackets and quotes, in addition to
  -- the default whitespace group.
  leap.opts.equivalence_classes = { ' \t\r\n', '([{', ')]}', '\'"`' }

  -- Set custom highlights
  -- vim.api.nvim_create_autocmd('ColorScheme', {
  -- callback = function()
  -- vim.api.nvim_set_hl(0, 'LeapLabel', { fg = '#000000', bg = '#CCFF88', bold = true })
  --   vim.api.nvim_set_hl(0, 'LeapBackdrop', { fg = '#777777' })
  --   vim.api.nvim_set_hl(0, 'LeapMatch', {
  --     fg = 'white',
  --     bold = true,
  --     nocombine = true,
  --   })
  --   end,
  -- })

  -- Disable safe labels for customization
  leap.opts.safe_labels = {}

  -- Optional: Highlight unlabeled targets in phase one
  leap.opts.highlight_unlabeled_phase_one_targets = true

  -- Set traversal keys for repeating motions
  require('leap.user').set_repeat_keys('<enter>', '<backspace>')
end

return M
