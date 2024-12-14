-- ╭─────────────────────────────────────────────────────────╮
-- │ Remove highlight on insert or cursor moved              │
-- ╰─────────────────────────────────────────────────────────╯
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

-- ╭─────────────────────────────────────────────────────────╮
-- │ Open and focus neo-tree (conditionally prioritize Lazy  │
-- │ window focus)                                           │
-- ╰─────────────────────────────────────────────────────────╯
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd([[
        Neotree filesystem show left
        ]])
    --   -- Check if any floating windows are open
    --   local floating_window_active = false
    --   for _, win in ipairs(vim.api.nvim_list_wins()) do
    --     local config = vim.api.nvim_win_get_config(win)
    --     if config.relative ~= "" then
    --       floating_window_active = true
    --       break
    --     end
    --   end
    --
    --   -- ╭─────────────────────────────────────────────────────────╮
    --   -- │ Open Neotree without focusing if a floating window is   │
    --   -- │ active                                                  │
    --   -- ╰─────────────────────────────────────────────────────────╯
    --   if not floating_window_active then
    --     vim.cmd([[
    --       Neotree filesystem focus left
    --       ]])
    --   else
    --     vim.cmd([[
    --       Neotree filesystem show left
    --       ]])
    --   end
  end,
})


-- ╭─────────────────────────────────────────────────────────╮
-- │ Add keymaps specifically for Neo-tree buffers           │
-- ╰─────────────────────────────────────────────────────────╯
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "neo-tree",
      callback = function()
        -- Set Telescope keymaps for Neo-tree
        local opts = { noremap = true, silent = false, buffer = true }
        vim.keymap.set('n', '<C-f>', ':Telescope live_grep<CR>', opts)
        vim.keymap.set('n', '<leader>f', ':Telescope find_files<CR>', opts)
      end,
    })

-- ╭─────────────────────────────────────────────────────────╮
-- │ Auto-refresh Neotree whenever GitSignsUpdate.           │
-- ╰─────────────────────────────────────────────────────────╯
local events = require("neo-tree.events")

vim.api.nvim_create_autocmd("User", {
  pattern = "GitSignsUpdate",
  callback = function()
    events.fire_event(events.GIT_EVENT) -- Trigger Neo-tree Git refresh
  end,
})
