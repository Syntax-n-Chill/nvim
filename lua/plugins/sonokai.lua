  return {
    'sainnhe/sonokai',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.sonokai_enable_italic = true
      vim.g.sonokai_better_performance = true
      vim.g.sonokai_style = 'espresso' -- espresso, shusia, maia, andromeda, anlantis
      vim.g.sonokai_transparent_background = 0
    end
  }
