return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        local function my_on_attach(bufnr)
            local api = require "nvim-tree.api"
            local km = vim.keymap.set

            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            -- api.config.mappings.default_on_attach(bufnr)

            -- custom mappings
            km('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
            km('n', 'cd', api.tree.change_root_to_node, opts('Change directory'))
            km('n', 'U', api.tree.toggle_custom_filter, opts('Show Hidden'))

            km('n', 'o', api.node.open.edit, opts('Open'))
            km('n', 'v', api.node.open.vertical, opts('Up'))
            km('n', 'h', api.node.open.horizontal, opts('Up'))
            km('n', 'p', api.node.open.preview, opts('Preview'))


            km('n', 'a', api.fs.create, opts('Create'))
            km('n', 'd', api.fs.remove, opts('Delete'))
            km('n', 'D', api.fs.trash, opts('Trash'))
            km('n', 'r', api.fs.rename, opts('Rename'))
            km('n', 'x', api.fs.cut, opts('Cut'))
            km('n', 'y', api.fs.copy.node, opts('Copy'))
            km('n', 'p', api.fs.paste, opts('Paste'))

            km('n', '>', api.node.navigate.sibling.next, opts('Next sibling'))
            km('n', '<', api.node.navigate.sibling.prev, opts('Previous sibling'))

            km('n', '.', api.node.run.cmd, opts('Run command'))

            km('n', '?', api.tree.toggle_help, opts('Help'))
            km('n', 'q', api.tree.close, opts('Quit'))
        end
        require('nvim-tree').setup({
            on_attach = my_on_attach,
        })
        vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { noremap = true, silent = true })
    end
}
