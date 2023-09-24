return {
    "nvim-treesitter/nvim-treesitter",
    priority = 100,
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { 'c', 'cpp', 'python', 'lua', 'vim', 'html', 'typescript' , 'go'},
        })
    end
}
