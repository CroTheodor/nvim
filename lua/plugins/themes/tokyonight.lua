return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		-- vim.cmd([[colorscheme tokyonight]])
		vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#51B3EC", bold = true })
		vim.api.nvim_set_hl(0, "LineNr", { fg = "white", bold = true })
		vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#FB508F", bold = true })
	end,
}
