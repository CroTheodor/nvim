vim.g.mapleader = " "
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.autoindent = true
vim.opt.smartcase = true
vim.opt.relativenumber = true
vim.opt.history = 1000
vim.opt.scrolloff = 10
vim.opt.list = true
vim.opt.listchars = {tab = ">> ", trail =".", nbsp = "_"}
vim.opt.undofile = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.cursorline = true
vim.opt.hlsearch = true
vim.keymap.set('n', "<Esc>", '<cmd>nohlsearch<CR>')
vim.api.nvim_set_option("clipboard", "unnamed")

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })

vim.diagnostic.config {
    update_in_insert = true
}
