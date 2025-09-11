vim.g.mapleader = " "
local map = vim.keymap.set

-- go to netrw
map("n", "<leader>pv", vim.cmd.Ex)

-- toggle bettween source and header files
map("n", "<C-h>", ":ClangdSwitchSourceHeader<CR>", {silent = true})

-- go to home screen
map("n", "<leader>hs", ":Alpha<CR><C-w>o", { silent = true })

-- change macro execution to leader a in visual mode
map("v", "<leader>a", ":norm! @a<CR>", { silent = true })

-- move selected lines around with J/K
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- change to light/dark mode
map("n", "<leader>lm", ":set background=light<cr>:colorscheme melange<cr>", { silent = true })
map("n", "<leader>dm", function()
  -- only source the colors and statusbar mapup
  vim.cmd("colorscheme eye-cancer")
end, { silent = true })

-- *** Mike's remaps ***
map("n", "<leader>ms", ":SessionSearch<CR>")

-- I've gotten used to this for switching back
-- to normal mode, but it's horrendous for certain
-- loop formats (e.g. for(int jj = 0; ...; ...) {...)
map("i", "jk", "<C-c>")
-- save faster
map("n", "<leader>w", ":w", { silent = true })
-- open neotree
map("n", "tt", ":Neotree reveal<CR>", { silent = true })
-- turn on spell check
map("n", "<leader>sp", ":setlocal spell spelllang=en_us<CR>")

-- the ultimate blame game
map("n", "<leader>gb", ":Git blame<CR><C-w>26<")

-- doom emacs window management
-- open/close windows
map("n", "<leader>wc", "<C-w>c")
map("n", "<leader>wo", "<C-w>o")
map("n", "<leader>wv", "<C-w>v")
map("n", "<leader>ws", "<C-w>s")
-- switch windows
map("n", "<leader>ww", "<C-w>w")
map("n", "<leader>wh", "<C-w>h")
map("n", "<leader>wj", "<C-w>j")
map("n", "<leader>wk", "<C-w>k")
map("n", "<leader>wl", "<C-w>l")
-- swap window position
map("n", "<leader>wH", "<C-w>H")
map("n", "<leader>wJ", "<C-w>J")
map("n", "<leader>wK", "<C-w>K")
map("n", "<leader>wL", "<C-w>L")
--resize windows // kind of stupid, but works replaced with resize mode
map("n", "<M-,>", "<C-w>5<")
map("n", "<M-.>", "<C-w>5>")
map("n", "<M-k>", "<C-w>5+")
map("n", "<M-j>", "<C-w>5-")

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- copy to clipboard
map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")
map("n", "<leader>Y", "\"+Y")
map("n", "<leader>d", "\"+d")
map("v", "<leader>d", "\"+d")
map("n", "<leader>D", "\"+D")

map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- reformat buffer
map("n", "<leader>f", function()
  -- local pretty_types = {
  --   "typescriptreact",
  --   "typescript",
  --   "javascript",
  --   "javascriptreact",
  --   "css",
  --   "html",
  --   "markdown",
  --   "json",
  -- }
  -- if vim.tbl_contains(pretty_types, vim.bo.filetype) then
  --   print("Prettifying...")
  --   vim.cmd("Format")
  -- else
  vim.lsp.buf.format()
  -- end
end)

-- change every occurance of word in buffer
map("n", "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- remaps for opening a terminal in vim
map("n", "<C-z>", "<C-w>s<C-w>j:terminal<CR><C-w>5-jjA", { silent = true })
map("t", "<C-z>", "<C-d><C-\\><C-n><C-w>c")
map("t", "jk", "<C-\\><C-n>")

-- toggle <space><space>w remap arrow keys to resize windows
map("n", "<leader><leader>w", ":lua ToggleResizeMode()<CR>", { silent = true })
KeyResizeEnabled = false

-- toggle window resize mode functions
function ToggleResizeMode()
  if KeyResizeEnabled then
    NormalArrowKeys()
  else
    ResizeArrowKeys()
  end
  KeyResizeEnabled = not KeyResizeEnabled
end

-- works as expected, moves cursor
function NormalArrowKeys()
  vim.notify("Arrrow keys in normal mode.", vim.log.levels.INFO)
  map("n", "<Up>", "<Up>")
  map("n", "<Down>", "<Down>")
  map("n", "<Left>", "<Left>")
  map("n", "<Right>", "<Right>")
end

-- resize windows (note: right/up is bigger, left/down is smaller)
function ResizeArrowKeys()
  vim.notify("Arrrow keys in resize mode.", vim.log.levels.INFO)
  map("n", "<Up>", "<C-w>+")
  map("n", "<Down>", "<C-w>-")
  map("n", "<Left>", "<C-w><")
  map("n", "<Right>", "<C-w>>")
end
