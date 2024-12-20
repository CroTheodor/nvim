local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("settings.vim-options")
require("settings.autocommands")
require("lazy").setup({
	spec = {
		{ import = "plugins.core" },
		{ import = "plugins.interface" },
		{ import = "plugins.misc" },
		{ import = "plugins.themes" },
		{ import = "plugins.utils" },
	},
})
