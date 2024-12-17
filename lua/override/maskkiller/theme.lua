-- local theme_name = 'citruszest'
local theme_name = 'sonokai'

vim.cmd('colorscheme ' .. theme_name)

require('lualine').setup({
  options = {
    theme = theme_name,
  },
})
