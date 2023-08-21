return {
    "gorbit99/codewindow.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-lua/plenary.nvim",
    },
    lazy = true,
    keys = { "<leader>mm", "<leader>mo" },
    config = function()
        local cw = require("codewindow")
        cw.setup()
        cw.apply_default_keybinds()
    end
}
