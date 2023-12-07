return {
  "https://github.com/leoluz/nvim-dap-go.git",
  ft = "go",
  opts = {
    delve = {
      path = table.concat({ vim.fn.stdpath "data", "mason", "bin", "dlv.cmd" }, "/"),
    }
  }
}
