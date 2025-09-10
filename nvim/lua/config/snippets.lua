-- snippets (this needs to run before the other code)
local ls = require('luasnip')
local s = ls.snippet
local fmt = require('luasnip.extras.fmt').fmt
local i = ls.insert_node
local rep = require('luasnip.extras').rep

vim.keymap.set({ "i", "s" }, "<C-l>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-h>", function() ls.jump(-1) end, { silent = true })


ls.add_snippets("all", {
  s("tgc", fmt("<{}>{}</{}>", { i(1, "Text"), i(2), rep(1) })),
  s("tgo", fmt("<{}/>", { i(1, "Text") })),
})
ls.add_snippets("python", {
  s("dbgo", fmt("__import__('APNT').logger.debug_obj({})", { i(1, "object") })),
})

require("luasnip.loaders.from_vscode").lazy_load()
