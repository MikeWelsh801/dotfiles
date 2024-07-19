return {
  -- markdown preview
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function() vim.fn["mkdp#util#install"]() end,
  config = function()
    vim.keymap.set("n", "<leader>md", ":MarkdownPreviewToggle<CR>")
  end
}
