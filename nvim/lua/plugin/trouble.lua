return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    height = 5,
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function()
    local trouble = require("trouble")

    -- vim.keymap.set("n", "[d", function()
    --   trouble.open();
    --   trouble.previous({ skip_groups = true, jump = true });
    -- end)
    --
    -- vim.keymap.set("n", "]d", function()
    --   trouble.open();
    --   trouble.next({ skip_groups = true, jump = true });
    -- end)

    vim.keymap.set("n", "<leader>xx", function() trouble.toggle() end)
    vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
    vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
    vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
    vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
    vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
  end
}
