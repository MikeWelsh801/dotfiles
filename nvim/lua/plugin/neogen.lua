return {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  event = "CursorMoved",
  config = function()
    require('neogen').setup({ snippet_engine = "luasnip" })

    vim.keymap.set("n", "<leader>jd", function()
      require('neogen').generate({ type = 'func' })
    end)
  end,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
}
