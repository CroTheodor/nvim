return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<C-p>', builtin.find_files, {desc = "Find files"})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "Live grep"})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "Find buffers"})
    end
}
