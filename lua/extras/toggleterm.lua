return {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {
    --[[ things you want to change go here]]
    open_mapping = [[<C-t>]], -- Map Ctrl + t to toggle the terminal
    direction = "float",      -- Set the terminal to use a floating window
    float_opts = {
      border = "curved",      -- Optional: style the border as curved
      winblend = 0,           -- Optional: adjust transparency (0-100)
    },
  },
}
