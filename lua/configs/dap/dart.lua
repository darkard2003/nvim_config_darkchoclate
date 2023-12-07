local M = {
  setup = function()
    local dap = require('dap')
    local dart_path = vim.fn.exepath("dart")
    local flutter_path = vim.fn.exepath("flutter")

    if vim.fn.executable(dart_path) == 0 then
      error("No dart executable found!")
      return
    end

    if vim.fn.executable(flutter_path) == 0 then
      error("No flutter executable found!")
      return
    end

    dap.adapters.dart = {
      type = "executable",
      command = "dart",
      args = { "debug_adapter" },
      port = 5032,
    }

    dap.configurations.dart = {
      {
        type = "dart",
        request = "launch",
        name = "Launch Dart Program",
        program = "${file}",
        cwd = "${workspaceFolder}",
        args = {}, -- For Dart apps, use "args". For Flutter apps, use "toolArgs".
        port = 5032,
      }
    }
  end
}

return M
