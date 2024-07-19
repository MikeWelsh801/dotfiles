return {
  'nvim-tree/nvim-web-devicons',
  lazy = true,
  config = function()
    require('nvim-web-devicons').setup({
      override_by_extension = {
        ["toml"] = {
          icon = "",
          color = "#827433",
          name = "toml"
        }
      },
    })
  end
}
