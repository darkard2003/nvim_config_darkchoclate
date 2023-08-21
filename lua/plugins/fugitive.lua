return {
    "tpope/vim-fugitive",
    lazy = true,
    cmd = { "Git", "G" },
    config = function()
        vim.g.fugitive_git_executable = "git"
    end,
}
