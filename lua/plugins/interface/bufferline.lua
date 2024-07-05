return {
    "akinsho/bufferline.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        local bufferline = require("bufferline")
        local notify = require"notify"

        if not bufferline then
            if notify then
                notify("failed loading bufferline")
            else
                print("failed loading bufferline")
            return
            end
        end

        local updateBufferNumber = function(skipBuffer)
            local buffers = vim.api.nvim_list_bufs()
            local keysBinded = 1
            skipBuffer = skipBuffer or -1
            for _, buffer in ipairs(buffers) do
                if vim.fn.buflisted(buffer) == 1 and keysBinded <= 9 and buffer ~= skipBuffer then
                    local bufname = vim.api.nvim_buf_get_name(buffer)
                    local filename = vim.fn.fnamemodify(bufname, ':t')
                    vim.keymap.set("n", "<leader>b" .. keysBinded, ":lua require'bufferline'.go_to("..keysBinded..")<CR>" ,
                        { desc = filename })
                    keysBinded = keysBinded + 1
                end
            end
        end

        vim.api.nvim_create_autocmd("bufreadpost", {
            callback = function()
                updateBufferNumber()
            end,
        })

        vim.api.nvim_create_autocmd("bufdelete", {
            callback = function()
                local bufnr = vim.fn.bufnr()
                if (vim.fn.buflisted(bufnr) == 1) then
                    local buff_number = #vim.fn.getbufinfo({ buflisted = 1 })
                    if buff_number <= 9 then
                        vim.keymap.set("n", "<leader>b".. buff_number, function ()
                            if notify then
                                notify("this buffer has been deleted")
                            else
                                print("this buffer has been deleted")
                            end
                        end, {desc = "--------"})
                    end
                    updateBufferNumber(bufnr)
                end
            end
        })

        updateBufferNumber()

        local delete_buffer = function()
            local bufnr = vim.api.nvim_get_current_buf()
            vim.api.nvim_buf_delete(bufnr, {})
        end

        vim.keymap.set("n", "<leader>bn", ":BufferLineNext<CR>", { desc = "[B]uffer [N]ext" })
        vim.keymap.set("n", "<leader>bb", ":BufferLinePrev<CR>", { desc = "[B]uffer [B]back" })
        vim.keymap.set("n", "<leader>bd", delete_buffer, { desc = "[B]uffer [D]elete" })

        bufferline.setup()
    end
}
