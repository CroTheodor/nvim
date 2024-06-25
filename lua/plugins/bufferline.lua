return {
    "akinsho/bufferline.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local bufferline = require("bufferline")
        if not bufferline then
            print("Failed loading bufferline")
            return
        end
        -- local notify = require"notify"
        -- local updateBufferNumber = function()
        --     local buff_number = #vim.fn.getbufinfo({ buflisted = 1 })
        --     local buf = vim.api.nvim_get_current_buf()
        --     local bufname = vim.api.nvim_buf_get_name(buf)
        --     local trimmed_bufname = vim.fn.fnamemodify(bufname, ":t")
        --     notify("Update buffer number called for "..trimmed_bufname)
        --     if buff_number <= 9 then
        --         vim.keymap.set("n", "<leader>b" .. buff_number, function() bufferline.go_to(buff_number) end,
        --             { desc = trimmed_bufname })
        --     end
        -- end
        -- vim.api.nvim_create_autocmd("BufReadPost", {
        --     callback = function()
        --         updateBufferNumber()
        --     end,
        -- })
        -- vim.api.nvim_create_autocmd("BufDelete", {
        --     callback = function()
        --         local bufnr = vim.fn.bufnr()
        --         if (vim.fn.buflisted(bufnr) == 1) then
        --             local buff_number = #vim.fn.getbufinfo({ buflisted = 1 })
        --             if buff_number <= 9 then
        --                 vim.keymap.set("n", "<leader>b".. buff_number, function ()
        --                     print("This buffer has been deleted")
        --                 end, {desc = "changed", silent = true})
        --                 vim.keymap.del("n", "<leader>b"..buff_number)
        --                 notify(vim.inspect(require("which-key")))
        --                 require("which-key").register({}, {mode = 'n'})
        --             end
        --         end
        --     end
        -- })
        local delete_buffer = function()
            local bufnr = vim.api.nvim_get_current_buf()
            vim.api.nvim_buf_delete(bufnr, {})
        end
        -- vim.keymap.set("n", "<leader>bn", "<CMD>lua require'bufferline'.move_to(1)<CR>", { desc = "[B]uffer [N]ext" })
        -- vim.keymap.set("n", "<leader>bb", "<CMD>lua require'bufferline'.move_to(-1)<CR>", { desc = "[B]uffer [B]back" })
        vim.keymap.set("n", "<leader>bd", delete_buffer, { desc = "[B]uffer [D]elete" })

        -- updateBufferNumber()
        bufferline.setup()
    end
}
