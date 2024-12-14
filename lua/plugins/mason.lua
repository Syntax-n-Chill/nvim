local M = {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"nvim-lua/plenary.nvim",
	},
}

M.execs = require("user.lsp-servers")

M.config = function()
	local wk = require("which-key")
	wk.add({
		{ "<leader>lI", "<cmd>Mason<CR>", desc = "Mason Info" },
	})

	require("mason").setup({
		ui = {
			border = "rounded",
		},
	})

	require("mason-lspconfig").setup({
		ensure_installed = M.execs,
	})
end

return M
