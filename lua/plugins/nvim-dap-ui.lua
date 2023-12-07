return {
  "rcarriga/nvim-dap-ui",
  requires = { "mfussenegger/nvim-dap" },
  config = function()
    require("dapui").setup()
    local km = vim.keymap.set
    local opts = { noremap = true, silent = true }
    km('n', '<leader>du', function()
      require("dapui").toggle()
    end, opts)
  end
}
