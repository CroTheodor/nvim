return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  --@type snacks.Config
  opts = {
    dashboard = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    bufdelete = { enable = true }
  },
  keys = {
    { "<C-d>", function() Snacks.bufdelete() end, desc = "Delete current buffer"},
    { "<leader>bda", function() Snacks.bufdelete.all() end, desc = "[B]uffer [D]elete [A]ll"},
    { "<leader>bdo", function() Snacks.bufdelete.other() end, desc = "[B]uffer [D]elete [O]ther"},
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command
      end,
    })
  end,
}
