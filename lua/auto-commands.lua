-- REMOVE HIGHLIGHT ON INSERT OR CURSORMOVED -- START
vim.api.nvim_set_keymap('n', '<Plug>(StopHL)', "execute('nohlsearch')[-1]", { noremap = true, expr = true })
vim.api.nvim_set_keymap('i', '<Plug>(StopHL)', "execute('nohlsearch')[-1]", { noremap = true, expr = true })

function HlSearch()
  local pos = vim.fn.match(vim.fn.getline('.'), vim.fn.getreg('/'), vim.fn.col('.') - 1) + 1
  if pos ~= vim.fn.col('.') then
    StopHL()
  end
end

function StopHL()
  if not vim.v.hlsearch or vim.fn.mode() ~= 'n' then
    return
  else
    vim.cmd [[silent! call feedkeys("\<Plug>(StopHL)", 'm')]]
  end
end

local searchHighlightGrp = vim.api.nvim_create_augroup('SearchHighlight', { clear = true })
vim.api.nvim_create_autocmd({ "CursorMoved" }, { group = searchHighlightGrp, pattern = '*', callback = HlSearch })
vim.api.nvim_create_autocmd({ "InsertEnter" }, { group = searchHighlightGrp, pattern = '*', callback = StopHL })
-- REMOVE HIGHLIGHT ON INSERT OR CURSORMOVED -- END

-- Open and focus neo-tree
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("Neotree filesystem focus left")
  end
})
