local M = {
  setup = function()
    local dap = require('dap')
    if not vim.fn.executable('lldb') then
      error('LLDB not found!')
      return
    end
    dap.adapters.lldb = {
      type = 'executable',
      command = 'lldb-vscode',
      name = "lldb"
    }
    dap.configurations.cpp = {
      {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
        runInTerminal = false
      }
    }
  end
}

return M
