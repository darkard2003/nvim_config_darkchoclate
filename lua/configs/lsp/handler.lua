local M = {}

local km = vim.keymap.set

M.setup = function()
    km("n", "gk", vim.diagnostic.open_float)
    km("n", "[d", vim.diagnostic.goto_prev)
    km("n", "]d", vim.diagnostic.goto_next)
    km("n", "<leader>q", vim.diagnostic.setloclist)
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn",  text = "" },
        { name = "DiagnosticSignHint",  text = "" },
        { name = "DiagnosticSignInfo",  text = "" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        -- disable virtual text
        virtual_text = true,
        -- show signs
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
        width = 60,
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
        width = 60,
    })
end

local function lsp_keymaps(buff)
    vim.bo[buff].omnifunc = "v:lua.vim.lsp.omnifunc"
    local opts = { buffer = buff, noremap = true }
    km("n", "gD", vim.lsp.buf.declaration, opts)
    km("n", "gd", vim.lsp.buf.definition, opts)
    km("n", "K", vim.lsp.buf.hover, opts)
    km("n", "gi", vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    km("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
    km("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
    km("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    -- vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    km("n", "<leader>fm", function()
        vim.lsp.buf.format({ async = true })
    end, opts)
    km("n", "<leader>rn", vim.lsp.buf.rename, opts)
    km({ "n", "<leader>ca" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    km("n", "gr", vim.lsp.buf.references, opts)
end

-- local function lsp_highlight_document(client)
-- 	local status_ok, illuminate = pcall(require, "illuminate")
-- 	if not status_ok then
-- 		return
-- 	end
-- 	illuminate.on_attach(client)
-- end

M.on_attach = function(client, bufnr)
    if client.name == "tsserver" then
        client.server_capabilities.document_formatting = false
    end
    -- if client.name == "clangd" then
    -- 	client.make_client_capabilities.offsetEncoding = { "utf-8", "utf-16" }
    -- end
    lsp_keymaps(bufnr)
end

local ok_cmp_lsp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if not ok_cmp_lsp then
    print("Error :: could not load nvim_cmp_lsp " .. cmp_lsp)
    return
end
local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = cmp_lsp.default_capabilities(capabilities)

return M
