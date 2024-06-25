return {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            keymaps = {
                normal = "<leader>s",
                normal_cur = "<leader>ss",
                normal_line = "<leader>S",
                normal_cur_line = "<leader>SS",
                visual = "S",
            }
        })
    end
}
