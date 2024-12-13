vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set relativenumber")

-- vim.cmd("set scrolloff=50")
vim.g.mapleader = " "

-- Enable folding
vim.opt.foldenable = true

-- Use expression-based folding for plugins like nvim-ufo
vim.opt.foldmethod = "expr"

-- Use nvim-ufo's fold expression
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Start with all folds open (you can set this to 0 to start with all folds closed)
vim.opt.foldlevelstart = 99

-- Limit fold nesting to a reasonable level
vim.opt.foldnestmax = 3

-- Set fold level (affects the visibility of nested folds)
vim.opt.foldlevel = 99

vim.opt.clipboard = 'unnamedplus'

vim.keymap.set('n', '<leader>fu', ':lua require("telescope.builtin").lsp_references()<CR>', { noremap = true, silent = true })
