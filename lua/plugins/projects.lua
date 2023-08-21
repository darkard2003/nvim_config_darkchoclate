return {
    "ahmedkhalf/project.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim"
    },
    config = function()
        require("project_nvim").setup()
        require("telescope").load_extension("projects")
        vim.keymap.set('n', '<leader>pr', '<cmd>Telescope projects<cr>', { noremap = true, silent = true })
    end
}
