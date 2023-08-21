return {
    'akinsho/flutter-tools.nvim',
    lazy = true,
    ft = { 'dart' },
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
