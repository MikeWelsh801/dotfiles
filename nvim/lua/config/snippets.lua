-- snippets (this needs to run before the other code)
local ls = require('luasnip')
local s = ls.snippet
local fmt = require('luasnip.extras.fmt').fmt
local i = ls.insert_node
local rep = require('luasnip.extras').rep

vim.keymap.set({ "i", "s" }, "<C-k>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-j>", function() ls.jump(-1) end, { silent = true })


ls.add_snippets("all", {
  s("tgc", fmt("<{}>{}</{}>", { i(1, "Text"), i(2), rep(1) })),
  s("tgo", fmt("<{}/>", { i(1, "Text") })),
})

require("luasnip.loaders.from_vscode").lazy_load()
