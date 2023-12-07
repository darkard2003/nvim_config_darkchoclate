return {
  'akinsho/flutter-tools.nvim',
  lazy = true,
  ft = { 'dart' },
  priority = 500,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim',
  },
  config = function()
    local m = require "configs.lsp.handler"
    require('flutter-tools').setup {
      lsp = {
        on_attach = m.on_attach,
        capabilities = m.capabilities,
      },
      -- debugger = {
      --   enabled = true,
      --   run_via_dap = true,
      -- },
      decorations = {
        statusline = {
          app_version = true,
          device = true,
        },
      },
      widget_guides = {
        enabled = true,
      },
    }

    require("telescope").load_extension("flutter")
    vim.keymap.set('n', "<leader>fc", ":Telescope flutter commands<CR>", { silent = true })
  end,
}
