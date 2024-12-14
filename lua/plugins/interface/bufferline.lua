return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local bufferline = require("bufferline")
    local notify = require("notify")

    if not bufferline then
      if notify then
        notify("failed loading bufferline")
      else
        print("failed loading bufferline")
        return
      end
    end

    vim.keymap.set("n", "<leader>bmb", ":BufferLineMovePrev<CR>", { desc = "[B]uffer [M]ove [B]back" })
    vim.keymap.set("n", "<leader>bn", ":BufferLineCycleNext<CR>", { desc = "[B]uffer [N]ext" })
    vim.keymap.set("n", "<leader>bb", ":BufferLineCyclePrev<CR>", { desc = "[B]uffer [B]back" })

    for i = 1, 9, 1 do
      vim.keymap.set(
        "n",
        "<leader>b" .. i,
        ":lua require'bufferline'.go_to_buffer(" .. i .. ", true)<CR>",
        { desc = "[B]uffer [" .. i .. "]"}
      )
    end

    bufferline.setup({
      options = {
        numbers = "ordinal",
        diagnostics = "nvim_lsp",
      },
      highlights = {
        buffer_selected = {
          underline = true,
        },
      },
    })
  end,
}
