local M = {
  setup = function()
    local dap = require('dap')
    if not vim.fn.executable('dart') then
      error('Dart not found!')
      return
    end
    if not vim.fn.executable('flutter') then
      error('Flutter not found!')
      return
    end
    dap.adapters.dart = {
      type = 'executable',
      command = 'dart',
      args = { 'debug_adapter' }
    }
    dap.adapters.flutter = {
      type = 'executable',
      command = 'flutter',
      args = { 'debug_adapter' }
    }
    dap.configurations.dart = {
      {
        type = "dart",
        request = "launch",
        name = "Launch dart",
        dartSdkPath = "~/flutter/bin/cache/dart-sdk",
        flutterSdkPath = "~/flutter",
        program = "${workspaceFolder}/lib/main.dart",
        cwd = "${workspaceFolder}",
      },
      {
        type = "flutter",
        request = "launch",
        name = "Launch flutter",
        dartSdkPath = "~/flutter/bin/cache/dart-sdk",
        flutterSdkPath = "~/flutter",
        program = "${workspaceFolder}/lib/main.dart",
        cwd = "${workspaceFolder}",
      }
    }
  end
}

return M
