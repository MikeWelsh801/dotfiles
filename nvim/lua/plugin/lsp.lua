return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v2.x",
  event = "CursorMoved",
  dependencies = {
    -- LSP Support
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    -- Autocompletion
    { "hrsh7th/nvim-cmp",                 lazy = true },
    { "hrsh7th/cmp-buffer",               lazy = true },
    { "hrsh7th/cmp-path",                 lazy = true },
    { "saadparwaiz1/cmp_luasnip",         lazy = true },
    { "hrsh7th/cmp-nvim-lsp",             lazy = true },
    { "hrsh7th/cmp-nvim-lua",             lazy = true },
    -- command line completes
    { "hrsh7th/cmp-cmdline",              lazy = true },

    -- Snippets
    { "L3MON4D3/LuaSnip",                 event = "CursorMoved" },
    { "rafamadriz/friendly-snippets",     lazy = true },
  },
  config = function()
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

    -- lsp
    local lsp = require("lsp-zero").preset({})

    lsp.ensure_installed({
      'rust_analyzer',
    })

    -- Fix Undefined global 'vim'
    lsp.nvim_workspace()

    local cmp = require('cmp')

    -- `/` cmdline setup.
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- `:` cmdline setup.
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' }
          }
        }
      })
    })

    -- *** cmp mappings caused caused a whole heap of trouble ***
    -- I think I got it dialled now, but I'm keeping all this commented out
    -- just in case.

    -- local cmp_action = require('lsp-zero').cmp_action()
    -- local cmp_select = {behavior = cmp.SelectBehavior.Select}
    -- local cmp_mappings = lsp.defaults.cmp_mappings({
    --     ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    --     ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    --     ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    --     ["<C-Space>"] = cmp.mapping.complete(),
    -- })
    --
    -- lsp.setup_nvim_cmp({
    --     mapping = cmp_mappings
    -- })
    cmp.setup({
      sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'buffer',  keyword_length = 3 },
        { name = 'luasnip', keyword_length = 1 },
      },
      mapping = {
        ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
        -- ["<C-n>"] = cmp_action.luasnip_jump_forward(),
        -- ["<C-p>"] = cmp_action.luasnip_jump_backward(),
      }
    })

    lsp.set_sign_icons({
      error = '✘',
      warn = '▲',
      hint = '⚑',
      info = '»'
    })

    lsp.set_preferences({
      suggest_lsp_servers = false,
      -- sign_icons = {
      --     error = 'E',
      --     warn = 'W',
      --     hint = 'H',
      --     info = 'I'
      -- }
    })

    lsp.on_attach(function(client, bufnr)
      local opts = { buffer = bufnr, remap = false }
      client.server_capabilities.semanticTokensProvider = nil

      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
      vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
      vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
      vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
      vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
      vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
      vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
      vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
      vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
      vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
      vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end)

    lsp.setup()

    vim.diagnostic.config({
      virtual_text = true
    })

    -- fixes gopls lsp error from stupid async crap to get the mod path that the
    -- lsp open source people refuse to fix
    local util = require('lspconfig/util')

    require('lspconfig').gopls.setup({
      root_dir = function(fname)
        -- see: https://github.com/neovim/nvim-lspconfig/issues/804
        local mod_cache = vim.trim(vim.fn.system 'go env GOMODCACHE')
        if fname:sub(1, #mod_cache) == mod_cache then
          local clients = vim.lsp.get_active_clients { name = 'gopls' }
          if #clients > 0 then
            return clients[#clients].config.root_dir
          end
        end
        return util.root_pattern 'go.work' (fname) or util.root_pattern('go.mod', '.git')(fname)
      end,
    })
  end
}
