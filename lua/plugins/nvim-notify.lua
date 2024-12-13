return {
  'rcarriga/nvim-notify',
  config = function()
    local notify = require("notify")
    notify.setup({
      -- background_colour = "#000000",
      timeout = 2000,
      stages = "fade",
      fps = 60,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { border = "rounded" })
      end,
    })
  end
}
