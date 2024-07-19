return {
  -- ************ NeoTree Stuff *****************************
  -- Unless you are still migrating, remove the deprecated commands from v1.x

  "nvim-neo-tree/neo-tree.nvim",
  cmd = { "Neotree" },
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-tree/nvim-web-devicons", lazy = true }, -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },

  config = function()
    require('neo-tree').setup({
      window = {
        width = 27,
      },
      -- FIX: Temporary hack to fix a break in neotree that causes an error when
      -- you close neotree from another window and try to reopen it. Remove this once
      -- pull request that fixes the issue is merged in neotree repo.
      event_handlers = {
        {
          event = 'neo_tree_buffer_leave',
          handler = function()
            local shown_buffers = {}
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              shown_buffers[vim.api.nvim_win_get_buf(win)] = true
            end
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
              if not shown_buffers[buf] and vim.api.nvim_buf_get_option(buf, 'buftype') == 'nofile' and vim.api.nvim_buf_get_option(buf, 'filetype') == 'neo-tree' then
                vim.api.nvim_buf_delete(buf, {})
              end
            end
          end,
        },
      }
    })
  end
}
