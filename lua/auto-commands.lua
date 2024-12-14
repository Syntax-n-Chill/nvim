-- Remove highlight on insert or cursor moved
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

-- Open and focus neo-tree (conditionally prioritize Lazy window focus)
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Check if any floating windows are open
    local floating_window_active = false
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local config = vim.api.nvim_win_get_config(win)
      if config.relative ~= "" then
        floating_window_active = true
        break
      end
    end

    -- Open Neotree without focusing if a floating window is active
    if not floating_window_active then
      vim.cmd([[
        Neotree filesystem focus left
      ]])
    else
      vim.cmd([[
        Neotree filesystem show left
      ]])
    end
  end,
})
