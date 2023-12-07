return {
  "mfussenegger/nvim-dap-python",
  lazy = true,
  ft = "python",
  config = function()
    local debugpy = table.concat({ vim.fn.stdpath "data", "mason", "packages", "debugpy","venv", "Scripts", "python.exe" }, '/')
    if not vim.fn.executable(debugpy) then
      debugpy = table.concat({ vim.fn.stdpath "data", "mason", "packages", "debugpy","venv", "bin", "python" }, '/')
    end
    require("dap-python").setup(debugpy)
  end,
}
