-- Set these highlights after you’ve applied your colorscheme
-- For example, after `colorscheme sonokai` in your config.

-- The main popup window background
vim.api.nvim_set_hl(0, 'WhichKeyFloat', { bg = '#1c1d28', fg = '#cfc9c2' })

-- The border around the popup
vim.api.nvim_set_hl(0, 'WhichKeyBorder', { bg = '#1c1d28', fg = '#565f89' })

-- The keys themselves
vim.api.nvim_set_hl(0, 'WhichKey', { bg = '#1c1d28', fg = '#bb9af7', bold = true })

-- The group names
vim.api.nvim_set_hl(0, 'WhichKeyGroup', { bg = '#1c1d28', fg = '#7aa2f7', bold = true })

-- The description text
vim.api.nvim_set_hl(0, 'WhichKeyDesc', { bg = '#1c1d28', fg = '#e2dfd7' })

-- The separators (like arrows or colons between keys and groups)
vim.api.nvim_set_hl(0, 'WhichKeySeperator', { bg = '#1c1d28', fg = '#565f89' })

-- Values that might appear next to keys
vim.api.nvim_set_hl(0, 'WhichKeyValue', { bg = '#1c1d28', fg = '#9ece6a' })
