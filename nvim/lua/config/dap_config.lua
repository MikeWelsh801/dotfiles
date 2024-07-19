local dap = require("dap")
local ui = require("dapui")

require("dapui").setup()
require("dap-go").setup()

require("nvim-dap-virtual-text").setup()

local cpptools = vim.fn.stdpath("data") .. "\\mason\\bin\\OpenDebugAD7.cmd"

if cpptools ~= "" then
  dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = 'executable',
    command = cpptools,
    options = {
      detached = false
    }
  }

  dap.configurations.cpp = {
    {
      name = "Launch file",
      type = "cppdbg",
      request = "launch",
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '\\', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopAtEntry = true,
      console = "integratedTerminal",
    },
  }
end

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<space>dc", dap.run_to_cursor)

-- Eval var under cursor
vim.keymap.set("n", "<space>?", function()
  require("dapui").eval(nil, { enter = true })
end)

vim.keymap.set("n", "<F1>", dap.continue)
vim.keymap.set("n", "<F2>", dap.step_into)
vim.keymap.set("n", "<F3>", dap.step_over)
vim.keymap.set("n", "<F4>", dap.step_out)
vim.keymap.set("n", "<F5>", dap.step_back)
vim.keymap.set("n", "<F10>", dap.restart)

dap.listeners.before.attach.dapui_config = function()
  ui.open()
end
dap.listeners.before.launch.dapui_config = function()
  ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  ui.close()
end
