return {
    "zbirenbaum/copilot-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    lazy = true,
    cmd = "Copilot",
    config = function()
        require("copilot").setup({
            suggetion = { enabled = false, },
            panel = { enabled = false },
        })
        require("copilot_cmp").setup()
    end
}
