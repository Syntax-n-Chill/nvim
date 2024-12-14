-- Remap Ctrl+h, Ctrl+j, Ctrl+k, and Ctrl+l to navigate between splits
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to the left split
keymap('n', '<C-h>', '<C-w>h', opts)
-- Move to the bottom split
keymap('n', '<C-j>', '<C-w>j', opts)
-- Move to the top split
keymap('n', '<C-k>', '<C-w>k', opts)
-- Move to the right split
keymap('n', '<C-l>', '<C-w>l', opts)

-- Ctrl + s save current file
keymap('n', '<C-s>', ':w<cr>', opts)

-- keymap('n', '<C-w>', '<Cmd>BufferKill<CR>', opts)

-- Cycle prev and next bufferline
keymap('n', '<M-h>', ':BufferLineCyclePrev<CR>', opts)
keymap('n', '<M-l>', ':BufferLineCycleNext<CR>', opts)
