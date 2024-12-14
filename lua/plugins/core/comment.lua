return {
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    },
    config = function()
        require('Comment').setup({
            padding = true,
            sticky = true,
            ignore = nil,
            toggler = {
                line = '<leader>/',
                block = 'gbc',
            },
            opleader = {
                line = '<leader>/',
                block = 'gb',
            },
            extra = {
                above = 'gcO',
                below = 'gco',
                eol = 'gcA',
            },
            mappings = {
                basic = true,
                extra = true,
            },
            ---Function to call before (un)comment
            pre_hook = nil,
            -- Function to call after (un)comment
            post_hook = nil,
        })
    end
}
