return {
  {
    'mhartington/formatter.nvim',
    event = "InsertEnter",
    config = function()
      require("formatter").setup({
        filetype = {
          ["typescript"] = {
            require("formatter.filetypes.typescript").prettier
          },
          typescriptreact = {
            require("formatter.filetypes.typescriptreact").prettier
          }
        }
      })
    end
  },
}
