local M = {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
}

M.config = function()
  require('mason-null-ls').setup({
    ensure_installed = require('user.null-ls-servers'),
    automatic_installation = true,
  })
end

return M
