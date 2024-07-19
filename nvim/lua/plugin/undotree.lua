return {
  'mbbill/undotree',
  config = function()
    -- undotree
    vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
  end

}
