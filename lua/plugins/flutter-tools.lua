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
        color = { -- show the derived colours for dart variables
          enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
          background = true, -- highlight the background
          background_color = { r = 19, g = 17, b = 24 }, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
          foreground = false, -- highlight the foreground
          virtual_text = true, -- show the highlight using virtual text
          virtual_text_str = "■", -- the virtual text character to highlight
        },
        on_attach = m.on_attach,
        capabilities = m.capabilities,
      },
      decorations = {
        statusline = {
          app_version = true,
          device = true,
        },
      },
      widget_guides = {
        enabled = true,
      },
      debugger = {
        enabled = true,
      },
      dev_log = {
        enabled = false,
      }

    }

    require("telescope").load_extension("flutter")
    vim.keymap.set('n', "<leader>fc", ":Telescope flutter commands<CR>", { silent = true })
  end,
}
