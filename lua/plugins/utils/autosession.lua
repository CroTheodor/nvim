return {
	{
		"rmagatti/auto-session",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("auto-session").setup({
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },

				session_lens = {
					theme_conf = { border = true },
					previewer = false,
					buftypes_to_ignore = {}, -- list of buffer types that should not be deleted from current session when a new one is loaded
				},
			})
			vim.keymap.set("n", "<leader>ls", require("auto-session.session-lens").search_session, {
				noremap = true,
			})
		end,
	},
}
