return {
    "mfussenegger/nvim-dap",
    priority = 500,
    config = function()
        local dap = require "dap"
        local km = vim.keymap.set
        local opts = { noremap = true, silent = true }

        km('n', '<leader>db', dap.toggle_breakpoint, opts)
        km('n', '<leader>dc', dap.continue, opts)
        km('n', '<leader>di', dap.step_into, opts)
        km('n', '<leader>do', dap.step_out, opts)
        km('n', '<leader>ds', dap.step_over, opts)
        km('n', '<leader>dr', dap.repl.open, opts)
        km('n', '<leader>dt', dap.terminate, opts)

        -- Change the breakpoint sign to a circle
        vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "", linehl = "", numhl = "" })

        local widgets = require "dap.ui.widgets"

        km('n', '<leader>dh', function()
            widgets.centered_float(widgets.scopes)
        end, opts)
        km('n', '<leader>dv', function()
            widgets.hover()
        end, opts)
    end,
}
