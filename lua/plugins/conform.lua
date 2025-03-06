local M = {
  'stevearc/conform.nvim',
  opts = {},
}

M.config = function()
  require('conform').setup({
    format_on_save = {
      timeout_ms = 250,
      lsp_format = 'fallback',
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform will run multiple formatters sequentially
      python = { 'isort', 'black' },
      -- You can customize some of the format options for the filetype (:help conform.format)
      rust = { 'rustfmt', lsp_format = 'fallback' },
      -- Conform will run the first available formatter
      javascript = { 'eslint', stop_after_first = true },
      -- npm install -g @fsouza/prettierd - improved performance formatter
    },
  })

  -- Normal mode paste + format
  vim.keymap.set('n', 'p', function()
    -- Perform the normal paste
    vim.cmd('normal! p')
    -- Run Conform format
    require('conform').format({ async = true })
  end, { silent = true })

  vim.keymap.set('n', 'P', function()
    vim.cmd('normal! P')
    require('conform').format({ async = true })
  end, { silent = true })

  -- Visual mode paste + format
  vim.keymap.set('v', 'p', function()
    vim.cmd('normal! p')
    require('conform').format({ async = true })
  end, { silent = true })

  vim.keymap.set('n', '<leader>P', function()
    vim.cmd('normal! p')
    require('conform').format({ async = true })
  end, { silent = true })
end
return M
