return {
	"sainnhe/sonokai",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.sonokai_enable_italic = true
		vim.g.sonokai_better_performance = true
		vim.g.sonokai_style = "shusia" -- espresso, shusia, maia, andromeda, atlantis
		vim.g.sonokai_transparent_background = 2
	end,
}
