-- miscellaneous plugins that don't need much configuration
return {
  {
      "MikeWelsh801/scratch.nvim",
      lazy = true,
      config = function ()
          vim.keymap.set('n', '<leader>tp', require("scratch").create_poop_float, {silent = true})
      end
  },
  {
    'norcalli/nvim-colorizer.lua',
    event = 'InsertEnter',
    config = function()
      require('colorizer').setup({ "*" }, { rgb_fn = true, hsl_fn = true })
    end
  },
  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = true }
  },

  -- I don't really like this one, so I'm removing it for now.
  -- {'tpope/vim-sleuth'}, -- Detect tabstop and shiftwidth automatically

  -- comments
  {
    'numToStr/Comment.nvim',
    event = "InsertEnter",
    config = function()
      require("Comment").setup()
    end
  },

  -- auto insert paretheses/brackets etc.
  -- again, I'm not sure I like this one, so I'm removing it.
  -- {
  --   'windwp/nvim-autopairs',
  --   event = "InsertEnter",
  --   opts = {} -- this is equalent to setup({}) function
  -- },

  -- adds coloring/icons for git info
  {
    'lewis6991/gitsigns.nvim',
    lazy = true,
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    'rmagatti/auto-session',
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      -- log_level = 'debug',
    }
  },
}
