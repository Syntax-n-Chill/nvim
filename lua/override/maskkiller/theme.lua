local theme_name = 'citruszest'

vim.cmd('colorscheme ' .. theme_name)

require('lualine').setup({
  options = {
    theme = theme_name,
  },
})
