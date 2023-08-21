local opts = {
    silent = true,
    noremap = true,
}

local km = vim.keymap.set

-- Set the leader
km("n", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better go back
km('i', "jk", "<ESC>", opts)

-- Better navigation
km("n", "<C-h>", "<C-w>h", opts)
km("n", "<C-j>", "<C-w>j", opts)
km("n", "<C-k>", "<C-w>k", opts)
km("n", "<C-l>", "<C-w>l", opts)

-- <leader>, x to close current buffer
km("n", "<leader>x", ":bd<CR>", opts)
