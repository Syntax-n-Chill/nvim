-- Set these highlights after you’ve applied your colorscheme
-- For example, after `colorscheme sonokai` in your config.

-- The main popup window background
vim.api.nvim_set_hl(0, 'WhichKeyFloat', { bg = '#021719', fg = '#cfc9c2' })

-- The border around the popup
vim.api.nvim_set_hl(0, 'WhichKeyBorder', { bg = '#021719', fg = '#9ece6a' })

-- The keys themselves
vim.api.nvim_set_hl(0, 'WhichKey', { bg = '#021719', fg = '#bb9af7', bold = true })

-- The group names
vim.api.nvim_set_hl(0, 'WhichKeyGroup', { bg = '#021719', fg = '#7aa2f7', bold = true })

-- The description text
vim.api.nvim_set_hl(0, 'WhichKeyDesc', { bg = '#021719', fg = '#e2dfd7' })

-- The separators (like arrows or colons between keys and groups)
vim.api.nvim_set_hl(0, 'WhichKeySeperator', { bg = '#021719', fg = '#9ece6a' })

-- Values that might appear next to keys
vim.api.nvim_set_hl(0, 'WhichKeyValue', { bg = '#021719', fg = '#9ece6a' })

-- Values that might appear next to keys
vim.api.nvim_set_hl(0, 'WhichKeyNormal', { bg = '#021719', fg = '#9ece6a' })
