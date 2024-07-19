return {
  {
    'tpope/vim-fugitive',
    event = "InsertEnter",
    config = function()
      -- fugitive
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
      --merge tool keymaps
      vim.keymap.set("n", "<leader>gds", ":Gvdiffsplit!<cr>");
      vim.keymap.set("n", "<leader>g", ":diffget \\\\2<cr>");
      vim.keymap.set("n", "<leader>h", ":diffget \\\\3<cr>");
    end
  },
}
