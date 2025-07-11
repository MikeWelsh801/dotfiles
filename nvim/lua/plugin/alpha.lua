return {
  -- spashscreen
  {
    'goolord/alpha-nvim',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons', lazy = true },
      { 'MikeWelsh801/scratch.nvim' }
    },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- Set header
      dashboard.section.header.val = {
        "__/\\\\\\\\\\_____/\\\\\\____________________________________________        ",
        " _\\/\\\\\\\\\\\\___\\/\\\\\\____________________________________________       ",
        "  _\\/\\\\\\/\\\\\\__\\/\\\\\\__________________/\\\\\\______________________      ",
        "   _\\/\\\\\\//\\\\\\_\\/\\\\\\___/\\\\\\____/\\\\\\__\\///______/\\\\\\\\\\__/\\\\\\\\\\___     ",
        "    _\\/\\\\\\\\//\\\\\\\\/\\\\\\__\\//\\\\\\__/\\\\\\____/\\\\\\___/\\\\\\///\\\\\\\\\\///\\\\\\_    ",
        "     _\\/\\\\\\_\\//\\\\\\/\\\\\\___\\//\\\\\\/\\\\\\____\\/\\\\\\__\\/\\\\\\_\\//\\\\\\__\\/\\\\\\_   ",
        "      _\\/\\\\\\__\\//\\\\\\\\\\\\____\\//\\\\\\\\\\_____\\/\\\\\\__\\/\\\\\\__\\/\\\\\\__\\/\\\\\\_  ",
        "       _\\/\\\\\\___\\//\\\\\\\\\\_____\\//\\\\\\______\\/\\\\\\__\\/\\\\\\__\\/\\\\\\__\\/\\\\\\_ ",
        "        _\\///_____\\/////_______\\///_______\\///___\\///___\\///___\\///__",
      }

      -- dashboard.section.header.opts.hl = "Operator"

      -- Set menu
      dashboard.section.buttons.val = {
        dashboard.button("e", " New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", " Find file", ":lua Snacks.picker.smart()<CR>"),
        dashboard.button("x", " Sessions", ":SessionSearch<CR>"),
        dashboard.button("r", " Recent", ":lua Snacks.picker.recent()<CR>"),
        dashboard.button("s", " Settings", ":lua Snacks.picker.files({ cwd = vim.fn.stdpath('config') })<CR>"),
        dashboard.button("q", "󰗼 Quit NVIM", ":qa<CR>"),
        dashboard.button("t", "💩 Toilet paper", ":PoopFloat<CR>"),
      }

      -- Send config to alpha
      alpha.setup(dashboard.opts)

      -- Disable folding on alpha buffer
      vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
    end
  },
}
