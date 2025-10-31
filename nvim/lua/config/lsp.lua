require("config.snippets")

local lsp_capabilities = require('blink.cmp').get_lsp_capabilities()

---@diagnostic disable-next-line: missing-fields
require('mason').setup({})
require('mason-lspconfig').setup({
  automatic_installation = false,
  ensure_installed = {},
  handlers = {
    function(server_name)
      vim.lspconfig[server_name].setup({
        capabilities = lsp_capabilities,
        settings = {
          Lua = {
            format = {
              indentSize = 2,
              indentStyle = "space",
            },
            diagnostics = {
              globals = { 'vim' }
            },
            workspace = {
              library = {
                vim.env.VIMRUNTIME
              },
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
          Python = {
            root_dir = {
              "requirements.txt"
            },
          },
          typescript = {
            format = {
              indentSize = 2,
              convertTabsToSpaces = true,
              tabSize = 2,
            },
            preferences = {
              indentStyle = "Smart",
            },
          },
          javascript = {
            format = {
              indentSize = 2,
              convertTabsToSpaces = true,
              tabSize = 2,
            },
            preferences = {
              indentStyle = "Smart",
            },
          },
        },
      })
    end,
  },
})

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    -- these will be buffer-local keybindings
    -- because they only work if you have an active language server

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "gI", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
    vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  end
})


vim.diagnostic.config({
  virtual_text = { current_line = true },
  virtual_lines = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '✘',
      [vim.diagnostic.severity.WARN] = '▲',
      [vim.diagnostic.severity.INFO] = '⚑',
      [vim.diagnostic.severity.HINT] = '»',
    }
  }
})
