local opt = vim.opt

-- relative line numbers
opt.nu = true
opt.relativenumber = true
-- I'm not sold on this, but I'll try it out.
opt.cursorline = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true
opt.inccommand = "split"

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

opt.colorcolumn = "80"

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.cmd("set nofoldenable")

-- ***CHANGE TERMINAL THAT OPENS WITH <C-z>***
opt.shell = "bash"
opt.shellcmdflag = '-c'
opt.shellxquote = ''

-- don't split up the status line
opt.laststatus = 3

-- creates little dots before where you type
opt.list = false
-- don't add eol that conflicts with vscode users
opt.fixeol = false

opt.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- sets highlighting when you yank something
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
