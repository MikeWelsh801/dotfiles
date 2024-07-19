return {
  -- spashscreen
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
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
     dashboard.button( "e", " New file" , ":ene <BAR> startinsert <CR>"),
     dashboard.button( "f", " Find file", ":Telescope find_files<CR>"),
     dashboard.button( "r", " Recent"   , ":Telescope oldfiles<CR>"),
     dashboard.button( "s", " Settings" , ":e $MYVIMRC | :cd %:p:h | :Neotree<CR>"),
     dashboard.button( "q", "󰗼 Quit NVIM", ":qa<CR>"),
 }

 -- Send config to alpha
 alpha.setup(dashboard.opts)

 -- Disable folding on alpha buffer
 vim.cmd([[
     autocmd FileType alpha setlocal nofoldenable
 ]])
     end
  },
}
