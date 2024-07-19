-- colors
return {
  { "catppuccin/nvim",                     lazy = true, name = "catppuccin" },
  { "ellisonleao/gruvbox.nvim",            lazy = true, name = "gruvbox" },
  { "savq/melange-nvim",                   lazy = true, name = "melange" },
  { "olivercederborg/poimandres.nvim",     lazy = true, name = "poimandres" },
  { 'rmehri01/onenord.nvim',               lazy = true, name = 'onenord', },
  { 'AlexvZyl/nordic.nvim',                lazy = true, name = 'nordic', },
  { 'sainnhe/everforest',                  lazy = true, name = 'everforest', },
  { 'folke/tokyonight.nvim',               lazy = true, name = 'tokyonight', },
  { "xero/miasma.nvim",                    lazy = true, name = 'miasma', },
  { "jnurmine/Zenburn",                    lazy = true, name = 'zenburn', },
  { 'fenetikm/falcon',                     lazy = true, name = 'falcon', },
  { 'karoliskoncevicius/sacredforest-vim', lazy = true, name = 'sacredforest', },
  { 'doums/darcula',                       lazy = true, name = 'darcula', },

  -- custom color scheme that builds on kanagawa
  {
    "MikeWelsh801/eye-cancer",
    priority = 1000,
    dependencies = { 'rebelot/kanagawa.nvim' },
    config = function()
      vim.cmd('colorscheme eye-cancer')
    end
  },
}
